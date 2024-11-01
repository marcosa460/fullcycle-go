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

O Dockerfile utiliza uma imagem base mínima (`scratch`) e um binário estático gerado para o Go, resultando em uma imagem extremamente compacta, atendendo ao requisito de menos de 2MB. Utilizamos as flags `-ldflags="-s -w"` para reduzir o tamanho do binário.

```dockerfile
FROM golang:alpine AS builder

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o fullcycle main.go

FROM scratch

COPY --from=builder /app/fullcycle /fullcycle

ENTRYPOINT ["/fullcycle"]
```

### Aviso

As flags `-ldflags="-s -w"` removem informações de depuração e a tabela de símbolos do binário, ajudando a reduzir o tamanho da imagem. Porém, isso também limita a capacidade de gerar "stack traces" detalhados, o que pode dificultar a resolução de problemas em produção. Portanto, é recomendável utilizar ferramentas de monitoramento e logs para complementar o diagnóstico.

## Links

- Docker Hub: [Link para a imagem Docker](https://hub.docker.com/r/marcosa460/fullcycle-go)
- Repositório GitHub: [Link para o repositório](https://github.com/marcosa460/fullcycle-go)

