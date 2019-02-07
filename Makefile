IMAGENAME := cchacin/openjdk
OPENJDK_VERSION := 11.0.2
MAVEN_VERSION := 3.6.0

SUBDIRS = jre openliberty-mp tomee-mp

.PHONY: help
help:
	cat Makefile

.PHONY: build $(SUBDIRS)
build:
	for dir in $(SUBDIRS); do \
		docker build -t ${IMAGENAME}:${OPENJDK_VERSION}-$$dir $$dir/.; \
  done

.PHONY: push $(SUBDIRS)
push:
	for dir in $(SUBDIRS); do \
		docker push ${IMAGENAME}:${OPENJDK_VERSION}-$$dir; \
	done
