# Step 1: build
FROM node:18 as build

WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Step 2: serve with nginx
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
