FROM maven:3.6-jdk-8 AS build
COPY ./src /usr/src/app/src
COPY ./pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package


FROM build AS test
ARG SONAR_ENABLED=false


WORKDIR /usr/src/app/
RUN if [ "$SONAR_ENABLED" = "true" ] ; \
    then mvn test sonar:sonar \
        -Dsonar.projectKey=pet-clinic \
        -Dsonar.host.url=sonarqube.trydevops.com \
        -Dsonar.login=9129b9b6db091d83679d3352f3237fa48e0c356d
    fi


FROM openjdk:9
COPY --from=build /usr/src/app/target/*.jar /usr/app/
EXPOSE 8080
# ENTRYPOINT ["java","-jar","/usr/app/*.jar"]
CMD java -jar -Dspring.profiles.active=mysql /usr/app/*.jar

