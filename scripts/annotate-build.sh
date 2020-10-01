#!/usr/bin/env sh

mkdir -p ./coverage

buildkite-agent artifact download coverage/index.html ./coverage

if [[ -f "coverage/index.html" ]]; then
  cat << EOF | buildkite-agent annotate --style "info"
  Read the <a href="artifact://coverage/index.html">coverage report</a>.
EOF
fi
