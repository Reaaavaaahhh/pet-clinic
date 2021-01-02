FROM tomcat:8
COPY target/*.war /usr/local/tomcat/webapps/pet-clinic.war
# Added to test webhook
