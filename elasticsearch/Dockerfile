# https://github.com/elastic/elasticsearch-docker
#FROM docker.elastic.co/elasticsearch/elasticsearch-oss:6.2.2

FROM quay.io/pires/docker-elasticsearch:6.2.3

MAINTAINER Theeye Boys

# Override config, otherwise plug-in install will fail
ADD config /elasticsearch/config

# Set environment
ENV DISCOVERY_SERVICE elasticsearch-discovery

# Kubernetes requires swap is turned off, so memory lock is redundant
ENV MEMORY_LOCK false

COPY config/sg/ config/sg/
COPY bin/ bin/

# Search Guard plugin
# https://github.com/floragunncom/search-guard/wiki
RUN elasticsearch-plugin install --batch com.floragunn:search-guard-6:6.2.3-22.0 \
	&& chmod +x plugins/search-guard-6/tools/*.sh \
	&& chown -R elasticsearch config/sg/ \
	&& chmod -R go= config/sg/

# Add your elasticsearch plugins setup here
# Example: RUN elasticsearch-plugin install analysis-icu
