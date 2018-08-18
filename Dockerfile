FROM alpine:latest

RUN apk update && \
apk upgrade && \
apk add wget git unzip python py-pip && \
pip install awscli==1.15.81 && \
pip install ansible==2.6.3 && \
wget https://releases.hashicorp.com/packer/1.2.5/packer_1.2.5_linux_amd64.zip && \
wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip && \
wget https://github.com/gruntwork-io/terragrunt/releases/download/v0.16.4/terragrunt_linux_amd64 -O /usr/local/bin/terragrunt && \
unzip '*.zip' -d /usr/local/bin/ && \ 
rm -f '*.zip' && \
apk -v --purge del py-pip && \
rm /var/cache/apk/* && \
chmod +x /usr/local/bin/* && \
adduser -D -u 1000 builder
USER builder
