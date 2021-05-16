#!/usr/bin/env bash
id="48b71133055fc4a"

cat > /tmp/upload.png
if [ "$(file -b --mime-type /tmp/upload.png)" != "image/png" ]; then
    exit 1
fi

response=$(https --ignore-stdin --check-status --form POST api.imgur.com/3/upload Authorization:"Client-ID $id" image@"/tmp/upload.png") && \
echo $response | jq -r '.data.link'
