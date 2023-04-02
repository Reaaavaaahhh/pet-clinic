FROM bitnami/java:1.8.362-debian-11-r23
WORKDIR /usr/app
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "spring-petclinic-2.4.0.BUILD-SNAPSHOT.jar"]
