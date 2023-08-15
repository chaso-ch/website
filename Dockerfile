FROM python:3-alpine as builder
COPY requirements.txt /app/requirements.txt
RUN apk add git build-base
WORKDIR /app
RUN pip install -r requirements.txt
COPY mkdocs.yml .
COPY docs/ /app/docs/
RUN mkdocs build

FROM registry.gitlab.com/ngine/docker-images/caddy:2.7
COPY --from=builder /app/site/ /usr/share/caddy/
