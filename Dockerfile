FROM ibmcom/detect-secrets:redhat-ubi

# Eliminate vulnerabilities found by trivy
# CVE-2022-42898 krb5-libs
RUN microdnf update

COPY entrypoint.sh /entrypoint.sh

ENV DS_REQUIRE_BASELINE=0 DS_ADDL_ARGS="" DS_BASELINE_FILE="./.secrets.baseline"

ENTRYPOINT ["/entrypoint.sh"]
