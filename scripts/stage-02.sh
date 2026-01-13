#!/bin/bash
set -e

cd ~/Desktop/E2E-Demo-Project/mooremarket

mkdir -p .github/workflows

cat > .github/workflows/ci.yml << 'EOF'
name: CI

on:
  pull_request:
    branches: 
      - main
      - dev

jobs:
  lint-test-build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses:  actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '18'
          cache: 'npm'

      - name: Install dependencies
        run: npm ci

      - name:  Lint
        run: npm run lint

      - name: Test
        run:  npm run test

      - name:  Build
        run: npm run build

      - name: Docker build (no push)
        run: docker build -t mooremarket: test . 
EOF

echo "✅ mooremarket CI workflow created"