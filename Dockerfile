FROM node:alpine 
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

# /app/build will have all the prod codes

FROM nginx
#needed for elasticbean port mapping
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html

