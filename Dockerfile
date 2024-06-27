# Etapa de construção
FROM golang:alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o fullcycle

# Imagem final
FROM scratch
COPY --from=builder /app/fullcycle /fullcycle
ENTRYPOINT ["/fullcycle"]
