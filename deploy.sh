#!/usr/bin/env nix shell nixpkgs#bash nixpkgs#fd nixpkgs#sops nixpkgs#docker --command bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"

mapfile -t env_files < <(fd -t f '^\.env$' "$ROOT_DIR")
cleanup() {
  echo "Re-encrypting secrets..."
  for env_file in "${env_files[@]}"; do
    sops -e -i "$env_file" || true
  done
}

trap cleanup EXIT

echo "Decrypting secrets..."
fd -t f '\.env$' "$ROOT_DIR" | while read -r env_file; do
  sops -d -i "$env_file"
done

mapfile -t compose_files < <(fd -t f '^docker-compose\.yml$' "$ROOT_DIR")
echo "Starting services..."
for compose_file in "${compose_files[@]}"; do
  dir="$(dirname "$compose_file")"
  echo "Deploying $dir..."
  (
    cd "$dir"
    docker compose up -d
  )
done

echo "Done."
