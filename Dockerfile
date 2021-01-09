FROM java:8-jdk-alpine
COPY spring-petclinic-2.4.0.BUILD-SNAPSHOT.jar /usr/app
WORKDIR /usr/app
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "spring-petclinic-2.4.0.BUILD-SNAPSHOT.jar"]
