FROM alpine:3.8

#INSTALL BUILD TOOLS
RUN apk update --no-cache && apk upgrade --no-cache && \
	apk add --no-cache --virtual .build-deps \
	gcc \
	openssl-dev \
	libffi-dev \
	python2-dev \
	build-base \
	musl-dev \
	py-pip && \
	pip install --no-cache-dir --upgrade pip==18.0 awscli==1.15.81 ansible==2.6.3 python-consul==1.1.0 boto==2.49.0 botocore==1.11.1 boto3==1.8.1 && \
	apk del .build-deps

RUN apk add --no-cache \
	wget \
	git \
	unzip \
	python && \
	wget https://releases.hashicorp.com/packer/1.2.5/packer_1.2.5_linux_amd64.zip && \
	wget https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip && \
	wget https://github.com/gruntwork-io/terragrunt/releases/download/v0.16.4/terragrunt_linux_amd64 -O /usr/local/bin/terragrunt && \
	unzip '*.zip' -d /usr/local/bin/ && \ 
	rm -f *.zip && \
	chmod +x /usr/local/bin/* && \
	adduser -D -u 1000 builder

USER builder
