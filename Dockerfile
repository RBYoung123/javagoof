FROM maven:3-jdk-8-slim

RUN mkdir /usr/src/goof
RUN mkdir /tmp/extracted_files
COPY . /usr/src/goof
COPY cert.pem /usr/src/goof
COPY key.pem /usr/src/goof
WORKDIR /usr/src/goof

ENV JAVA_TOOL_OPTIONS=-javaagent:/usr/src/goof/trend_app_protect-4.2.0.jar
ENV TREND_AP_KEY=f09374c9-f7a0-4463-9c00-ee6ccfaa1541
ENV TREND_AP_SECRET=a1003e05-16ab-4a2f-9bba-2224eba69d54
ENV TREND_AP_LOG_FILE=STDERR

RUN mvn install

EXPOSE 8080
ENTRYPOINT ["mvn", "tomcat7:run"]
