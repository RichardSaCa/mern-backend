# Etapa 1: Construcción (opcional, útil si tienes un proceso de build)
FROM node:18-alpine AS build

# Configurar el directorio de trabajo
WORKDIR /usr/src/app

# Copiar los archivos necesarios para instalar las dependencias
COPY package*.json ./

# Instalar dependencias
RUN npm install

# Copiar el resto del código fuente
COPY . .



# Etapa 2: Producción
FROM node:18-alpine

# Configurar el directorio de trabajo
WORKDIR /usr/src/app

# Copiar solo los archivos necesarios desde la etapa de build
# COPY --from=build /usr/src/app .

# Exponer el puerto en el que tu aplicación escucha (por defecto 3000 para Express)
EXPOSE 5000

# Comando por defecto para ejecutar la aplicación
CMD ["node", "server.js"]
