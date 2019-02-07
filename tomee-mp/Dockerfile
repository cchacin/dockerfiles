FROM alpine:3.9 as builder

ENV PATH /usr/local/tomee/bin:$PATH
RUN mkdir -p /usr/local/tomee

RUN apk --update add --no-cache ca-certificates axel

RUN axel -n 10 http://ftp.wayne.edu/apache/tomee/tomee-8.0.0-M2/apache-tomee-8.0.0-M2-microprofile.tar.gz -o /tmp/tomee.tar.gz \
  && tar -zxf /tmp/tomee.tar.gz \
  && mv apache-tomee-microprofile-8.0.0-M2/* /usr/local/tomee


FROM cchacin/openjdk:11.0.1-runtime

ENV PATH /usr/local/tomee/bin:$PATH

WORKDIR /usr/local/tomee

COPY --from=builder /usr/local/tomee /usr/local/tomee

ENV INSTALL_DIR /usr/local/tomee/
ENV CONFIG_DIR /usr/local/tomee/conf/
ENV DEPLOYMENT_DIR /usr/local/tomee/webapps

EXPOSE 8080

CMD ["catalina.sh", "run"]
