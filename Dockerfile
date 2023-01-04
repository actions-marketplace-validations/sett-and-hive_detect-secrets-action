FROM ibmcom/detect-secrets:redhat-ubi

# Eliminate vulnerabilities found by trivy
# CVE-2022-42898 krb5-libs
RUN microdnf -y update \
    && microdnf -y clean all

# Eliminate vulnerabilities found by trivy
# CVE-2022-23491 certifi package
RUN python3 -m pip install --no-cache-dir certifi==2022.12.7 --upgrade

COPY entrypoint.sh /entrypoint.sh

ENV DS_REQUIRE_BASELINE=0 DS_ADDL_ARGS="" DS_BASELINE_FILE="./.secrets.baseline"

ENTRYPOINT ["/entrypoint.sh"]
