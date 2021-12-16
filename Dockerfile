FROM hashicorp/terraform:1.0.11

RUN \
  apk update && \
  apk add bash py-pip && \
  apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python3-dev make && \
  pip install --upgrade pip && \
  pip install azure-cli && \
  apk del --purge build

RUN addgroup --gid 1000 "jenkins" && \
    adduser \
    --disabled-password \
    --gecos "" \
    --ingroup "jenkins" \
    --uid "1000" "jenkins"



USER jenkins
