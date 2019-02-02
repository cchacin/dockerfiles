FROM alpine:3.8 as builder

ENV RELEASE 2019-01-24_2339
ENV VERSION 19.0.0.1
RUN apk --update add --no-cache ca-certificates axel \
  && mkdir /opt \
  && axel -n 10 https://public.dhe.ibm.com/ibmdl/export/pub/software/openliberty/runtime/release/${RELEASE}/openliberty-webProfile8-${VERSION}.zip \
  && unzip openliberty-webProfile8-${VERSION}.zip -d /opt \
  && rm openliberty-webProfile8-${VERSION}.zip

FROM cchacin/openjdk:11.0.1-runtime

COPY --from=builder /opt/wlp /opt/wlp

ENV INSTALL_DIR /opt/wlp/
ENV USR_DIR ${INSTALL_DIR}usr/
ENV CONFIG_DIR ${USR_DIR}servers/defaultServer/
ENV DEPLOYMENT_DIR ${USR_DIR}servers/defaultServer/dropins/

RUN mkdir -p ${USR_DIR}
ADD https://github.com/WASdev/sample.opentracing.zipkintracer/releases/download/1.2/liberty-opentracing-zipkintracer-1.2-sample.zip /
RUN unzip liberty-opentracing-zipkintracer-1.2-sample.zip -d ${USR_DIR}

COPY server.xml ${CONFIG_DIR}configDropins/defaults/

EXPOSE 9080 9443

CMD ["/opt/wlp/bin/server", "run", "defaultServer"]
