# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Scenario.Repo.insert!(%Scenario.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Scenario.{Automations, Origins}

feature_data = [
  %{
    feature: "Login",
    description: "Sucess Login",
    project_id: 1
  },
  %{
    feature: "Login",
    description: "Error Login",
    project_id: 2
  }
]

project_data = [
  %{
    name: "Timeline"
  },
  %{
    name: "Admin"
  },
  %{
    name: "Android"
  },
  %{
    name: "AWS"
  }
]

# Enum.each(feature_data, fn(data) ->
#   Automations.create_feature(data)
# end

Enum.each(project_data, &Origins.create_project/1)

Enum.each(feature_data, &Automations.create_feature/1)
