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

  mix phx.gen.live Automations Project projects name:string

  mix phx.gen.live Automations Status status name:string

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

### Table: status

This table shows the status of scenarios.

| Column Name | Type    | Description          |
| :---------: | ------- | :------------------- |
|     id      | int     | The id of the status |
|    name     | varchar | Name of the status   |
