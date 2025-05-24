#!/bin/bash

# Function to initialize cursor rules and GitHub custom instruction files in current directory

init_dev_files() {
  echo "Initializing development files in $(pwd)..."

  if [ ! -d ".cursor/rules" ]; then
    mkdir -p .cursor/rules
    echo "Created .cursor/rules directory"
  fi

  if [ ! -f ".cursor/rules/rules.mdc" ]; then
    echo "Creating .cursor/rules/rules.mdc..."
    cat >".cursor/rules/rules.mdc" <<'EOL'
# Cursor Rules

When working with this codebase:

- Follow the project's coding style and conventions
- Keep functions small and focused on a single responsibility
- Include appropriate error handling
- Prefer modern JavaScript/TypeScript features where applicable

EOL
    echo "✅ .cursor/rules/rules.mdc created"
  else
    echo "⚠️ .cursor/rules/rules.mdc already exists"
  fi

  if [ ! -d ".github" ]; then
    mkdir -p .github
    echo "Created .github directory"
  fi

  if [ ! -f ".github/copilot-instructions.md" ]; then
    echo "Creating .github/copilot-instructions.md..."
    cat >".github/copilot-instructions.md" <<'EOL'
# GitHub Copilot Instructions

When working with this codebase:

- Follow the project's coding style and conventions
- Keep functions small and focused on a single responsibility
- Include appropriate error handling
- Prefer modern JavaScript/TypeScript features where applicable


EOL
    echo "✅ .github/copilot-instructions.md created"
  else
    echo "⚠️ .github/copilot-instructions.md already exists"
  fi

  echo "✨ Done initializing development files"
}
