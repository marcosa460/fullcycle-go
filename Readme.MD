# Full Cycle Docker - Go Lang

Este repositório contém a solução do desafio Full Cycle, onde o objetivo é criar uma imagem Docker com um código em Go que exiba a mensagem **"Full Cycle Rocks!!"** ao ser executado. A imagem deve ser o menor possível, com menos de 2MB.

## Desafio

- Criar um programa em Go Lang que imprima a mensagem **"Full Cycle Rocks!!"**.
- Criar uma imagem Docker que execute esse programa.
- A imagem deve ser publicada no Docker Hub.
- O tamanho da imagem deve ser menor que 2MB.

## Como Executar

1. Execute o seguinte comando para rodar a imagem:

```sh
docker run marcosa460/fullcycle-go
```

Você verá a seguinte saída:

```
Full Cycle Rocks!!
```

## Estrutura do Projeto

O projeto possui um simples código Go que imprime a mensagem desejada. Utilizamos uma abordagem otimizada para manter a imagem Docker abaixo de 2MB, fazendo uso de imagens mínimas como base, garantindo um container leve.

### Dockerfile

O Dockerfile utiliza uma imagem base mínima (`scratch`) e um binário estático gerado para o Go. Isso resulta em uma imagem extremamente compacta, atendendo ao requisito de menos de 2MB.

```dockerfile
FROM golang:alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o fullcycle main.go

FROM scratch
COPY --from=builder /app/fullcycle /fullcycle
ENTRYPOINT ["/fullcycle"]
```

## Links

- Docker Hub: [Link para a imagem Docker](https://hub.docker.com/r/marcosa460/fullcycle-go)
- Repositório GitHub: [Link para o repositório](https://github.com/marcosa460/fullcycle-go)
