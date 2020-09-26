defmodule Scenario.Repo.Migrations.CreateFeatures do
  use Ecto.Migration

  def change do
    create table(:features) do
      add :feature, :string
      add :description, :string

      timestamps()
    end

  end
end
