FROM openjdk:8
ENV APP_HOME=/root/dev/myapp/
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
RUN git clone https://github.com/spring-projects/spring-petclinic.git
WORKDIR spring-petclinic
RUN ./mvnw package
#RUN echo $(ls /root/dev/myapp/spring-petclinic/target/)
ENTRYPOINT ["java","-jar","/root/dev/myapp/spring-petclinic/target/spring-petclinic-2.4.0.BUILD-SNAPSHOT.jar"]
#RUN java -jar target/*.jar




#COPY build.gradle gradlew gradlew.bat $APP_HOME
#COPY gradle $APP_HOME/gradle
# download dependencies
#RUN ./gradlew build -x :bootRepackage -x test --continue
#COPY . .
#RUN ./gradlew build