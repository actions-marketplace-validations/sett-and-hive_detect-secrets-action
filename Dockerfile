FROM python:3.7.6-alpine3.11

RUN pip install detect-secrets==0.13.1
RUN apk --no-cache add git less openssh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
