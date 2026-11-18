#!/bin/bash
# Open a fresh profile in preview mode with Pandoc rendering enabled.
set -euo pipefail
profile=$(mktemp -d)
note="$profile/spans.md"
printf 'Trigger: ' > "$note"
cat >> "$note" <<'MARKDOWN'


[Reference]{.mark}

::: {style="background-color: #b8dcff; color: #143550"}
Fenced div example
:::

Outside paragraph.
MARKDOWN
version=$(node -p 'require("./package.json").version')
cat > "$profile/config.json" <<JSON
{"version":"$version","openPaths":["$note"],"system":{"checkForUpdates":false},"display":{"renderingMode":"preview","renderPandoc":true,"renderEmphasis":true}}
JSON
cat > "$profile/documents.yaml" <<YAML
f90e5fc5-10aa-4795-adf4-8bd38f6dc2d8:
  type: leaf
  id: c5946d30-fb11-4aca-a9da-4e07491ce5f0
  openFiles:
    - path: $note
      pinned: false
  activeFile:
    path: $note
    pinned: false
YAML
export NODE_ENV=production
exec "${ZETTLR_ELECTRON:-node_modules/electron/dist/Electron.app/Contents/MacOS/Electron}" . \
  --data-dir="$profile" --user-data-dir="$profile" --remote-debugging-port=9325
