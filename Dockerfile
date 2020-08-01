FROM node:12.16.2 AS builder

WORKDIR /app

ENV PATH /app/node_nodules/.bin:$PATH

COPY package.json package-lock.json /app/
RUN npm install
RUN npm install -g @angular/cli@9.1.3

COPY . /app

RUN ng build

FROM nginx:1.18.0 AS caramiascloset

RUN rm -rf /usr/share/nginx/html/*

COPY --from=builder /app/dist/caraMiasCloset /usr/share/nginx/html
RUN ls -l /usr/share/nginx/html
RUN ls -l /usr/share/nginx
CMD ["nginx", "-g", "daemon off;"]
