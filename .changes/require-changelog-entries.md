---
bump: patch
category: Changes
kind: ci
---

Require every pull request to include a `.changes/` entry: CI now runs `changewrite check` and fails when no unreleased entry is present.
