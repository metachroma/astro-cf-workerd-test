FROM node:18

RUN apt-get update && apt-get -y install libc++1

# Create app directory
WORKDIR /app
COPY dist/ /app/dist
COPY config.capnp /app

# Install app dependencies
RUN npm install workerd
RUN npx workerd compile config.capnp > workerd

#Expose 8080
EXPOSE 8080:8080
EXPOSE 8081:8081

# Run app

CMD ./workerd