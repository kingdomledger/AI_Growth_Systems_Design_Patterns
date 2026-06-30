#!/usr/bin/env node

/**
 * Public-safe identifier normalization helper.
 *
 * This example intentionally avoids production names, private schemas,
 * real source systems, real creator records, and private enrichment logic.
 */

export function normalizeHandle(value) {
  if (!value) return null;

  const normalized = String(value)
    .trim()
    .replace(/^@+/, '')
    .toLowerCase();

  return normalized || null;
}

export function normalizeProfileUrl(value) {
  if (!value) return null;

  try {
    const url = new URL(String(value).trim());
    url.hash = '';
    url.search = '';

    const pathname = url.pathname.replace(/\/+$/, '');
    url.pathname = pathname || '/';

    return url.toString().replace(/\/$/, '');
  } catch {
    return null;
  }
}

export function classifyIdentifier({ type, value }) {
  const strongTypes = new Set(['profile_url', 'platform_handle']);

  return {
    type,
    value,
    strength: strongTypes.has(type) && value ? 'strong' : 'weak',
    can_resolve_identity: strongTypes.has(type) && Boolean(value),
  };
}

export function buildIdentityCandidates(sourceRow) {
  const profileUrl = normalizeProfileUrl(sourceRow.profile_url);
  const handle = normalizeHandle(sourceRow.handle);

  const identifiers = [
    classifyIdentifier({ type: 'profile_url', value: profileUrl }),
    classifyIdentifier({ type: 'platform_handle', value: handle }),
    classifyIdentifier({ type: 'display_name', value: sourceRow.display_name || null }),
    classifyIdentifier({ type: 'bio_summary', value: sourceRow.bio_summary || null }),
  ];

  return {
    source_item_id: sourceRow.source_item_id,
    strong_identifiers: identifiers.filter((item) => item.strength === 'strong'),
    weak_attributes: identifiers.filter((item) => item.strength === 'weak'),
  };
}

if (import.meta.url === `file://${process.argv[1]}`) {
  const demoRow = {
    source_item_id: 'source_item_001',
    profile_url: 'https://social.example/Example_Creator?ref=demo',
    handle: '@Example_Creator',
    display_name: 'Example Creator',
    bio_summary: 'Builds public tutorials about AI operations.',
  };

  console.log(JSON.stringify(buildIdentityCandidates(demoRow), null, 2));
}
