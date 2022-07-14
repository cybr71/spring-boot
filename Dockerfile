FROM maven:3.8-jdk-11 as spring-boot
WORKDIR ./built-app
COPY . .
RUN mvn clean install

FROM openjdk:jdk-bullseye
WORKDIR ./app
COPY --from=spring-boot ./built-app/target/*.jar ./app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]