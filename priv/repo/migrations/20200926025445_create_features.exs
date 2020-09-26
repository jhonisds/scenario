defmodule Scenario.Repo.Migrations.CreateFeatures do
  use Ecto.Migration

  def change do
    create table(:features) do
      add :feature, :string
      add :scenario, :string
      add :status, :string

      timestamps()
    end

  end
end
