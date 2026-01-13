#!/bin/bash
set -e

cd ~/Desktop/E2E-Demo-Project/mooremarket || exit 1

cat > Dockerfile << 'EOF'
FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . . 
RUN npm run build

FROM nginx:stable-alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
EOF

cat > nginx.conf << 'EOF'
server {
    listen 80;
    server_name localhost;
    root /usr/share/nginx/html;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }

    location /health {
        access_log off;
        return 200 '{"status":"healthy","app":"mooremarket"}';
        add_header Content-Type application/json;
    }
}
EOF

cat > .github/workflows/cd.yml << 'EOF'
name: CD

on:
  push:
    branches: 
      - main

jobs:
  build-push: 
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Generate version tag
        id: version
        run: echo "TAG=$(date +'%Y%m%d%H%M%S')-${GITHUB_SHA::7}" >> $GITHUB_OUTPUT

      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}

      - name: Build and push
        uses: docker/build-push-action@v5
        with:
          context: . 
          push: true
          tags: ${{ secrets.DOCKERHUB_USERNAME }}/mooremarket:${{ steps.version.outputs.TAG }}

      - name: Save version
        run: echo "${{ steps.version.outputs.TAG }}" >> $GITHUB_STEP_SUMMARY
EOF

echo "✅ mooremarket Dockerfile + CD workflow created"