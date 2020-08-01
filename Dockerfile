FROM node:12.16.2

WORKDIR /app

ENV PATH /app/node_nodules/.bin:$PATH

COPY package.json /app/package.json
RUN npm install
RUN npm install -g @angular/cli@9.1.3

COPY . /app

CMD ng serve --host 0.0.0.0
