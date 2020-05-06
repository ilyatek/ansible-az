FROM mcr.microsoft.com/azure-cli:latest

ARG BUILD_DATE
ARG VERSION

LABEL maintainer="Ilyatek" \
      org.label-schema.schema-version=${VERSION} \
      org.label-schema.build-date=${BUILD_DATE} \
      org.label-schema.name="ansible-az" \
      org.label-schema.description="ansible and az cli and tools." \
      org.label-schema.vcs-url="https://github.com/ilyatek/ansible-az"


RUN pip install ansible ansible-lint

RUN mkdir -p /etc/ansible \
 && echo 'localhost' > /etc/ansible/hosts \
 && echo -e """\
\n\
Host *\n\
    StrictHostKeyChecking no\n\
    UserKnownHostsFile=/dev/null\n\
""" >> /etc/ssh/ssh_config


CMD bash



