# Utilizando uma imagem base com JDK 17 e Alpine para melhor desempenho e menor tamanho
FROM openjdk:17-alpine AS build

# Definindo o diretório de trabalho no contêiner
WORKDIR /app

# Copiando arquivos de configuração do Gradle
COPY gradle /app/gradle
COPY build.gradle /app/
COPY settings.gradle /app/

# Copiando o script gradlew e dando permissões de execução
COPY gradlew /app/gradlew
RUN chmod +x /app/gradlew

# Baixando dependências do Gradle (evitando problemas de cache)
RUN ./gradlew build --no-daemon || return 0

# Copiando o código-fonte do projeto
COPY src /app/src

# Criando o JAR (bootJar) para execução
RUN ./gradlew bootJar --no-daemon

# Imagem mínima para execução do aplicativo
FROM openjdk:17-alpine

# Definindo o diretório de trabalho no contêiner
WORKDIR /app

# Criando o usuário sem privilégios administrativos
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copiando o JAR gerado da imagem de construção para a imagem final
COPY --from=build /app/build/libs/*.jar app.jar

# Garantindo que o usuário appuser tenha permissão para acessar os arquivos
RUN chown -R appuser:appgroup /app

# Mudando para o usuário sem privilégios administrativos
USER appuser

# Comando para rodar o aplicativo
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
