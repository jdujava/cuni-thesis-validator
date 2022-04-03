# Container image that runs your code
FROM alpine:3.10

COPY verapdf/ /usr/bin/verapdf
COPY verify /usr/bin/verify
COPY UK-7987-version1-custom8.xml uk-profile.xml

ENV PATH="/usr/bin/verapdf:${PATH}"

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
