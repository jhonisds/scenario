# Scenario

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Install Node.js dependencies with `npm install` inside the `assets` directory
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix

## Create Module

```shell

  mix phx.gen.live Automations Feature features feature:string description:string

  mix phx.gen.live Origins Project projects name:string

  mix phx.gen.live Conditions Status statuses name:string

  # example ->  Boats Boat boats model:string...

```

## Database

### Table: features

Table of the features

| Column Name | Type    | Description                 |
| :---------: | ------- | :-------------------------- |
|     id      | int     | The id of the feature       |
|   feature   | varchar | Name of the feature         |
| description | varchar | Description of the scenario |
|  id_status  | varchar | ID status                   |
| id_project  | varchar | ID project                  |

### Table: projects

This table indicate the origin of the scenarios.

| Column Name | Type    | Description           |
| :---------: | ------- | :-------------------- |
|     id      | int     | The ID of the project |
|    name     | varchar | Name of project       |

### Table: statuses

This table shows the statuses of scenarios.

| Column Name | Type    | Description          |
| :---------: | ------- | :------------------- |
|     id      | int     | The id of the status |
|    name     | varchar | Name of the status   |

## Create Migrations

```shell
  mix ecto.gen.migration add_references_features
```

## Create Auth

- Add phx_gen_auth to mix: {:phx_gen_auth, "~> 0.5.0"} `mix deps.get`
- Run `mix phx.gen.auth Accounts User users`
- Add bcrypt_elixir, comeonin, elixir_make run: `mix deps.get``
- Run `mix ecto.migrate`
