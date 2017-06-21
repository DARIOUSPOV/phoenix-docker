Small starter project for phoenix on docker

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

In another shell
```
docker-compose run web mix phoenix.gen.html User users name:string email:string bio:string number_of_pets:integer
```
Edit `hello_phoenix/web/router.ex` and add `resources "/users", UserController` like this:
```
  scope "/", HelloPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/users", UserController
  end
```

```
docker-compose run web mix ecto.migrate
```

Visit: http://localhost:4000/users
