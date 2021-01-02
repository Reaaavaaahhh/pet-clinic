FROM openjdk
COPY target/*.jar /usr/local/tomcat/webapps/pet-clinic.jar
# Added to test webhook
