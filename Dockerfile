FROM python:3-alpine

RUN apk update && apk upgrade && apk --no-cache add bash git less openssh && pip install detect-secrets

COPY entrypoint.sh /entrypoint.sh

ENV DS_REQUIRE_BASELINE=0 DS_ADDL_ARGS="" DS_BASELINE_FILE="./.secrets.baseline"

ENTRYPOINT ["/entrypoint.sh"]
