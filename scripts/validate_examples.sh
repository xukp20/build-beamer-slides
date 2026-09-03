#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
project_dir="$(cd "$script_dir/.." && pwd)"

if [[ $# -gt 1 ]]; then
  echo "Usage: validate_examples.sh [OUTPUT_DIR]" >&2
  exit 64
fi

if [[ $# -eq 1 ]]; then
  output_root="$1"
  mkdir -p "$output_root"
  output_root="$(cd "$output_root" && pwd)"
else
  output_root="$(mktemp -d)"
fi

# Build from a clean copy of the current source tree so validation neither
# rewrites committed PDFs nor reuses LaTeX intermediates and rendered previews.
source_copy="$(mktemp -d)"
trap 'rm -rf "$source_copy"' EXIT
while IFS= read -r -d '' relative_path; do
  case "$relative_path" in
    *.pdf) continue ;;
  esac
  mkdir -p "$source_copy/$(dirname "$relative_path")"
  cp "$project_dir/$relative_path" "$source_copy/$relative_path"
done < <(
  git -C "$project_dir" ls-files -z --cached --others --exclude-standard -- \
    styles examples
)

decks=(
  "styles/light/template-169.tex"
  "styles/warm-editorial/template-169.tex"
  "styles/slate-violet/template-169.tex"
  "examples/research-system-architecture/deck.tex"
  "examples/experimental-results-review/deck.tex"
  "examples/random-walks-on-graphs/deck.tex"
  "examples/software-system-migration/deck.tex"
  "examples/style-comparison/light.tex"
  "examples/style-comparison/warm.tex"
)

for relative_deck in "${decks[@]}"; do
  render_name="${relative_deck%.tex}"
  render_name="${render_name//\//-}"
  "$script_dir/render_and_check.sh" \
    "$source_copy/$relative_deck" \
    "$output_root/$render_name"
done

echo "Validated ${#decks[@]} decks."
echo "Rendered previews: $output_root"
echo "Next step: visually inspect every rendered page at original detail."
