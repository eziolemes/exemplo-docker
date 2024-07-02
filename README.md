## Descrição

Exemplo de como subir um ambiente com Docker Compose

## Instalação

```bash
$ docker build -t api-rocket:v1 .
$ docker-compose up -d
```

## Verificando aplicação

```bash
$ docker logs api-rocket
$ docker logs mysql
```

## Encerrar a execução dos containers

```bash
$ docker-compose stop

```

