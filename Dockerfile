FROM chainguard/hugo@sha256:3333634a7a848a818cb30860710049748e491cf70c385532c070671ffe37a2e2 as builder
WORKDIR /usr/src/app
COPY . .
RUN hugo

FROM nginx:1.27.0-alpine
COPY --from=builder /usr/src/app/public /usr/share/nginx/html
EXPOSE 3030
CMD ["nginx", "-g", "daemon off;"]