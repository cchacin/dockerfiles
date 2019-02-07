FROM adoptopenjdk/openjdk11-openj9:x86_64-alpine-jdk-11.0.2.9 as openjdkbuilder

RUN jlink \
     --module-path /opt/java/openjdk/jmods \
     --compress=2 \
     --strip-debug \
     --add-modules java.base,java.datatransfer,java.instrument,java.logging,java.management,java.management.rmi,java.naming,java.net.http,java.prefs,java.rmi,java.se,java.security.jgss,java.security.sasl,java.smartcardio,java.sql,java.sql.rowset,java.transaction.xa,java.xml,java.xml.crypto,jdk.jfr,jdk.attach,jdk.management,jdk.management.jfr,jdk.management.agent,jdk.unsupported \
     --no-header-files \
     --no-man-pages \
     --output /opt/java/openjdk-minimal

FROM alpine:3.9

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

COPY --from=openjdkbuilder /opt/java/openjdk-minimal /opt/java/openjdk

ENV JAVA_HOME /opt/java/openjdk
ENV PATH $JAVA_HOME/bin:$PATH
ENV JAVA_TOOL_OPTIONS="-XX:+UseContainerSupport"
