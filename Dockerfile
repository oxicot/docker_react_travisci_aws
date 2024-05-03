# START: BUILD PHASE
FROM node:16-alpine as builder

WORKDIR /app

# Install the Node dependencies
COPY package.json .
RUN npm install

COPY . .

RUN npm run build
# END: BUILD PHASE


# START: RUN PHASE
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
# END: RUN PHASE