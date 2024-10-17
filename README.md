# README

This is a simple Rails API server that provides a basic REST API for items.
The codebase was stood up using rails commands which are logged in the commit history.
There is a [github action](./.github/workflows/ci.yml) that runs linting and tests on push to main and pull requests creation.

## Running this project:

This project has a docker-compose.yaml and a Dockerfile allowing for development version of the server to run in containers.

You can use install [Docker Desktop and Docker Engine](https://docs.docker.com/engine/install/).
There are alternatives you can use if you prefer such as [Colima](https://github.com/abiosoft/colima) or [Orbstack](https://orbstack.dev/)

## System Startup:
from doc root of the project:
```shell
docker compose up [--detach]
```
This will standup the rails server with a postgres container and [seed some `items`](./db/seeds.rb) into the database.

## API Endpoints:

Basic REST crud for `items` at: [http://localhost:3000/items/](http://localhost:3000/items)

## Postman (optional):

Postman client can be used without an account you can download it here: [Download Postman](https://www.postman.com/downloads/).
There is a Postman collection exported: [./docs/Dev Test - REST API basics](./docs/Dev%20Test%20-%20REST%20API%20basics.postman_collection.json).
You can [import this collection](https://learning.postman.com/docs/getting-started/importing-and-exporting/importing-and-exporting-overview/).

## Testing:

Currently this is using Rail's test framework, this will likely be switched to RSpec in the future.

```shell
docker compose run --rm rails ./bin/rails test
```

## Rails Console:

```shell
docker compose run --rm rails ./bin/rails console
```