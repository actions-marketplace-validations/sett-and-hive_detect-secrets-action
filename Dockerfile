FROM ibmcom/detect-secrets:master-583-id-257787835-time-1668488211 

COPY entrypoint.sh /entrypoint.sh

ENV DS_REQUIRE_BASELINE=0 DS_ADDL_ARGS="" DS_BASELINE_FILE="./.secrets.baseline"

ENTRYPOINT ["/entrypoint.sh"]
