---
name: Keep highlighting after typing an empty Pandoc span
target: desktop
launch: bash .proofed/zettlr/launch.sh
cdp_endpoint: http://127.0.0.1:9325
paths: [source/app/service-providers/config/get-config-template.ts, source/common/modules/markdown-editor/parser/markdown-parser.ts, source/common/modules/markdown-editor/parser/pandoc-div-span-parser.ts, source/common/modules/markdown-editor/renderers/index.ts, source/common/modules/markdown-editor/renderers/render-emphasis.ts, source/common/modules/markdown-editor/renderers/render-pandoc-div-span.ts, source/common/modules/markdown-editor/theme/syntax.ts, source/common/modules/markdown-editor/util/configuration.ts, source/common/modules/markdown-editor/util/custom-tags.ts, source/common/modules/markdown-utils/index.ts, source/common/modules/markdown-utils/markdown-ast/index.ts, source/common/modules/markdown-utils/markdown-ast/parse-children.ts, source/common/modules/markdown-utils/markdown-to-html.ts, source/win-main/MainEditor.vue, source/win-preferences/schema/editor.ts, source/win-print/App.vue]
---
The open note shows `Trigger:` at the top, `Reference` highlighted in yellow below it, a blue `Fenced div example` block, and `Outside paragraph.` at the bottom.

1. In the note editor, click the blank space immediately to the right of `Trigger:` on the same line to put the caret there.
2. Press the keys for `[]{.underline}` at the caret, character by character, keeping the existing text. The first line now reads `Trigger: []{.underline}`.
3. Click the words `Outside paragraph.` in the note.
4. Check that `Reference` still has a yellow highlight. Stop after this check.
