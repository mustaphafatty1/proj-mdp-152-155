```
# Stage 1: Build application
FROM maven:3.6.0-jdk-8 AS build
WORKDIR /app
COPY pom.xml .
COPY src src
RUN mvn clean package

# Stage 2: Tomcat image
FROM tomcat:9.0
COPY --from=build /app/target/CalculatorApp.war /usr/local/tomcat/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]
```