# GitHub workflow integration

This repo is meant to be used alongside your normal GitHub workflow (PRs, CI, reviews).

## PR template

If you adopt the optional `.github/pull_request_template.md`, every PR will carry:
- the Linear issue ID/link
- a test plan
- risk/rollback notes

This is boring, and boring is good.

## Linear ↔ GitHub integration

Linear can link issues with PRs/commits and optionally automate status changes.

Docs:
- https://linear.app/integrations/github

Recommended practice:
- Create a Linear issue for any meaningful change.
- Use the Linear-generated branch name for your Git branch.
- Include the Linear issue ID in the PR title.

This provides traceability without heavy process overhead.
