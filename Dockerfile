FROM maven:3.6-jdk-11 AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package

##########

FROM openjdk:11
WORKDIR /app

COPY --from=build /usr/src/app/target/pdf-1.0.0-SNAPSHOT.jar ./pdf-1.0.0-SNAPSHOT.jar
CMD [ "java", "-jar", "pdf-1.0.0-SNAPSHOT.jar" ]
