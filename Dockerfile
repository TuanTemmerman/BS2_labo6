FROM maven:3.5-jdk-8 as BUILD
COPY src /usr/src/myapp/src
COPY pom.xml /usr/src/myapp
RUN mvn -f /usr/src/myapp/pom.xml clean package

FROM tomcat:latest
COPY --from=BUILD /usr/src/myapp/target/*.war /usr/local/tomcat/webapps/project-ucll.war
EXPOSE 8080
