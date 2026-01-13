#!/bin/bash
set -e

cd ~/Desktop/E2E-Demo-Project/mooremarket

mkdir -p .github

cat > .github/CODEOWNERS << 'EOF'
# All changes require approval from
* @iam-mdthalha
EOF

cat > .github/pull_request_template.md << 'EOF'
## Description
Brief description of changes. 

## Checklist
- [ ] Code builds successfully
- [ ] Tests pass
- [ ] Ready for review

## Reviewer
@iam-mdthalha
EOF

echo "✅ mooremarket approval rules created"