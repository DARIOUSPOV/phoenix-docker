```
docker-compose build

docker-compose run -w /app web mix phoenix.new hello_phoenix
```

edit `hello_phoenix/config/dev.exs` and replace `localhost` with `postgres`

```
docker-compose run web mix ecto.create

docker-compose up
```

visit http://localhost:4000
