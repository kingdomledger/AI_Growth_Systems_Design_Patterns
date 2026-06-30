-- Public-safe operational checks for the Creator Lead Identity & Review Pipeline.
-- These checks are examples of the kinds of queries used to inspect workflow state.

-- 1. Confirm the expected public-pattern tables exist.
select table_name
from information_schema.tables
where table_schema = 'public'
  and table_name in (
    'lead_source_queue',
    'canonical_leads',
    'identity_registry',
    'identity_conflicts',
    'lead_enrichments',
    'lead_exports'
  )
order by table_name;

-- 2. Registry should contain only strong identifiers.
select identifier_strength, count(*)
from identity_registry
group by identifier_strength;

-- 3. Detect duplicate strong identifiers if a unique index was missing or bypassed.
select identifier_type, identifier_value_norm, count(*) as duplicate_count
from identity_registry
group by identifier_type, identifier_value_norm
having count(*) > 1;

-- 4. Surface unresolved identity conflicts for operator review.
select conflict_id, identifier_type, identifier_value_norm, candidate_uuids, created_at
from identity_conflicts
where resolution_status = 'unresolved'
order by created_at asc;

-- 5. Find approved enrichments that have not yet been exported.
select e.enrichment_id, e.uuid, e.human_review_status, e.created_at
from lead_enrichments e
left join lead_exports x on x.enrichment_id = e.enrichment_id
where e.human_review_status = 'approved'
  and x.export_id is null
order by e.created_at asc;

-- 6. Find export failures ready for retry or operator review.
select export_id, uuid, destination_system, destination_ref, export_status, last_error, updated_at
from lead_exports
where export_status in ('pending', 'failed')
order by updated_at asc;

-- 7. Confirm duplicate-safe handoff by grouping destination export state.
select uuid, destination_system, destination_ref, count(*) as export_rows
from lead_exports
group by uuid, destination_system, destination_ref
having count(*) > 1;
