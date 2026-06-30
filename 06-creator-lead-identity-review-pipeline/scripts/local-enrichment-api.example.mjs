#!/usr/bin/env node

/**
 * Public-safe local enrichment API adapter example.
 *
 * Purpose:
 * - demonstrate an API boundary between n8n orchestration and enrichment logic
 * - avoid embedding all prompt/model logic directly inside a workflow canvas
 * - provide a stable request/response contract that could later be hosted
 *
 * This mock server does not call a real LLM provider.
 */

import http from 'node:http';

const PORT = Number(process.env.PORT || 8787);

function readJsonBody(request) {
  return new Promise((resolve, reject) => {
    let body = '';

    request.on('data', (chunk) => {
      body += chunk;
      if (body.length > 1_000_000) {
        reject(new Error('Request body too large'));
        request.destroy();
      }
    });

    request.on('end', () => {
      try {
        resolve(body ? JSON.parse(body) : {});
      } catch (error) {
        reject(error);
      }
    });
  });
}

function buildSyntheticEnrichment(payload) {
  const summaryText = [
    payload.public_signals?.category,
    payload.public_signals?.bio_summary,
    payload.handle_norm,
  ]
    .filter(Boolean)
    .join(' ')
    .toLowerCase();

  const hasWorkflowSignal = /workflow|automation|operations|ops/.test(summaryText);
  const confidence = hasWorkflowSignal ? 0.87 : 0.54;

  return {
    uuid: payload.uuid,
    fit_tier: confidence >= 0.8 ? 'high' : 'review',
    confidence,
    summary: hasWorkflowSignal
      ? 'Strong public workflow-automation signal.'
      : 'Needs operator review before qualification.',
    recommended_action: confidence >= 0.8 ? 'review_for_export' : 'hold_for_review',
    human_review_status: 'pending',
    contract_version: 'public-demo-v1',
  };
}

const server = http.createServer(async (request, response) => {
  response.setHeader('content-type', 'application/json');

  if (request.method !== 'POST' || request.url !== '/enrich-lead') {
    response.writeHead(404);
    response.end(JSON.stringify({ error: 'not_found' }));
    return;
  }

  try {
    const payload = await readJsonBody(request);

    if (!payload.uuid) {
      response.writeHead(400);
      response.end(JSON.stringify({ error: 'uuid_required' }));
      return;
    }

    response.writeHead(200);
    response.end(JSON.stringify(buildSyntheticEnrichment(payload), null, 2));
  } catch (error) {
    response.writeHead(400);
    response.end(JSON.stringify({ error: 'invalid_json', message: error.message }));
  }
});

server.listen(PORT, () => {
  console.log(`Synthetic enrichment API listening on http://localhost:${PORT}/enrich-lead`);
});
