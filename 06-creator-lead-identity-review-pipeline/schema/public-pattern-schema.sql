-- Public-safe PostgreSQL-style schema for the Creator Lead Identity & Review Pipeline.
-- This is synthetic portfolio code. It does not contain production table names,
-- private schemas, credentials, real leads, or private integration details.

create table if not exists lead_source_queue (
  queue_id bigserial primary key,
  source_platform text not null,
  source_item_id text not null,
  raw_payload jsonb not null default '{}'::jsonb,
  processing_status text not null default 'queued',
  processing_attempts integer not null default 0,
  canonical_uuid text,
  last_error text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  processed_at timestamptz,
  constraint lead_source_queue_status_check
    check (processing_status in (
      'queued',
      'processing',
      'processed',
      'existing',
      'conflict',
      'skipped',
      'failed'
    ))
);

create unique index if not exists lead_source_queue_unique_source_row
on lead_source_queue(source_platform, source_item_id);

create index if not exists lead_source_queue_status_idx
on lead_source_queue(processing_status, created_at);

create table if not exists canonical_leads (
  uuid text primary key,
  platform text not null,
  handle_norm text,
  profile_url_norm text,
  display_name text,
  identity_status text not null default 'resolved',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint canonical_leads_identity_status_check
    check (identity_status in ('resolved', 'needs_review', 'merged', 'archived'))
);

create table if not exists identity_registry (
  registry_id bigserial primary key,
  uuid text not null references canonical_leads(uuid),
  identifier_type text not null,
  identifier_value_norm text not null,
  identifier_strength text not null default 'strong',
  source_queue_id bigint references lead_source_queue(queue_id),
  created_at timestamptz not null default now(),
  constraint identity_registry_identifier_type_check
    check (identifier_type in ('profile_url', 'platform_handle')),
  constraint identity_registry_identifier_strength_check
    check (identifier_strength = 'strong')
);

-- One strong identifier should only point to one canonical UUID.
create unique index if not exists identity_registry_unique_identifier
on identity_registry(identifier_type, identifier_value_norm);

create index if not exists identity_registry_uuid_idx
on identity_registry(uuid);

create table if not exists identity_conflicts (
  conflict_id bigserial primary key,
  source_queue_id bigint references lead_source_queue(queue_id),
  identifier_type text not null,
  identifier_value_norm text not null,
  candidate_uuids text[] not null,
  conflict_reason text not null,
  resolution_status text not null default 'unresolved',
  operator_action text not null default 'review_before_merge',
  resolved_by text,
  resolved_at timestamptz,
  created_at timestamptz not null default now(),
  constraint identity_conflicts_resolution_status_check
    check (resolution_status in ('unresolved', 'merged', 'split', 'ignored', 'source_repaired'))
);

create index if not exists identity_conflicts_unresolved_idx
on identity_conflicts(resolution_status, created_at)
where resolution_status = 'unresolved';

create table if not exists lead_enrichments (
  enrichment_id bigserial primary key,
  uuid text not null references canonical_leads(uuid),
  enrichment_status text not null default 'drafted',
  fit_tier text,
  confidence numeric(4, 3),
  summary text,
  recommended_action text,
  model_contract_version text not null default 'public-demo-v1',
  human_review_status text not null default 'pending',
  reviewer_notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint lead_enrichments_status_check
    check (enrichment_status in ('drafted', 'validated', 'failed', 'superseded')),
  constraint lead_enrichments_review_status_check
    check (human_review_status in ('pending', 'approved', 'rejected', 'needs_revision')),
  constraint lead_enrichments_confidence_check
    check (confidence is null or (confidence >= 0 and confidence <= 1))
);

create index if not exists lead_enrichments_review_queue_idx
on lead_enrichments(human_review_status, created_at);

create table if not exists lead_exports (
  export_id bigserial primary key,
  uuid text not null references canonical_leads(uuid),
  enrichment_id bigint references lead_enrichments(enrichment_id),
  destination_system text not null,
  destination_ref text not null,
  export_status text not null default 'pending',
  idempotency_key text not null,
  exported_at timestamptz,
  last_error text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint lead_exports_status_check
    check (export_status in ('pending', 'exported', 'duplicate_noop', 'failed', 'cancelled'))
);

-- Prevent duplicate handoff to the same destination reference.
create unique index if not exists lead_exports_unique_destination
on lead_exports(uuid, destination_system, destination_ref);

create unique index if not exists lead_exports_unique_idempotency_key
on lead_exports(idempotency_key);

create index if not exists lead_exports_status_idx
on lead_exports(export_status, created_at);
