[private]
@default:
  just --list

# Build, try, and run a test workshop with the SDK
[group("dev")]
run:
  sdkcraft try
  mkdir -p /tmp/just-sdk-test
  printf 'name: test-just\nbase: ubuntu@24.04\nsdks:\n  - name: try-just\n' > /tmp/just-sdk-test/workshop.yaml
  cd /tmp/just-sdk-test && workshop launch
  cd /tmp/just-sdk-test && workshop shell test-just
  cd /tmp/just-sdk-test && workshop remove test-just
  rm -rf /tmp/just-sdk-test

# Run spread tests
[group("dev")]
test:
  sdkcraft test

# Export store credentials for CI
[group("release")]
export-credentials:
  @secret-tool lookup service sdkcraft username api.charmhub.io

# Build and release SDK to the store (amd64 + arm64)
[group("release")]
release:
  sdkcraft pack
  sdkcraft upload just_amd64.sdk --release latest/stable
  sdkcraft upload just_arm64.sdk --release latest/stable
  rm -f just_*.sdk

# Check for new upstream releases and update VERSION
[group("maintenance")]
update:
  #!/usr/bin/env bash
  set -euo pipefail
  current=$(cat VERSION)
  latest=$(gh release view --repo casey/just --json tagName -q '.tagName')
  if [[ "$current" == "$latest" ]]; then
    echo "Already up to date: $current"
  else
    echo "$latest" > VERSION
    echo "Updated VERSION: $current -> $latest"
  fi
