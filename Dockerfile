FROM alpine:3.8

RUN apk update --no-cache && apk upgrade --no-cache && \
	apk add --no-cache --virtual .build-deps \
	wget \
	gcc \
	openssl-dev \
	libffi-dev \
	python2-dev \
	build-base \
	musl-dev \
	git \
	unzip \
	python \
	py-pip && \
pip install --no-cache-dir --upgrade pip==18.0 awscli==1.15.81 ansible==2.6.3 && \
wget https://releases.hashicorp.com/packer/1.2.5/packer_1.2.5_linux_amd64.zip && \
wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip && \
wget https://github.com/gruntwork-io/terragrunt/releases/download/v0.16.4/terragrunt_linux_amd64 -O /usr/local/bin/terragrunt && \
unzip '*.zip' -d /usr/local/bin/ && \ 
rm -f '*.zip' && \
apk del .build-deps && \
chmod +x /usr/local/bin/* && \
adduser -D -u 1000 builder
USER builder
