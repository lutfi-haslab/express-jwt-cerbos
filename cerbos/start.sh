LATEST_VERSION=$(curl --silent "https://api.github.com/repos/cerbos/cerbos/releases/latest" | jq -r .tag_name)

docker run -i -t -p 3592:3592 -h 0.0.0.0 \
  -v $(pwd)/config:/config \
  -v $(pwd)/policies:/policies \
  ghcr.io/cerbos/cerbos:"${LATEST_VERSION:1}" \
  server --config=/config/conf.yaml
