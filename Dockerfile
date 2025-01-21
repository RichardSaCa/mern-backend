# Usar una imagen base ligera de Node.js
FROM node:18-alpine

# Configurar el directorio de trabajo
WORKDIR /usr/src/app

# Copiar los archivos necesarios
COPY package*.json ./

# Instalar las dependencias
RUN npm install

# Copiar el resto del código fuente
COPY . .

# Exponer el puerto en el que tu aplicación escucha
EXPOSE 5000

# Comando para iniciar la aplicación
CMD ["node", "server.js"]