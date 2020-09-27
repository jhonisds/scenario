defmodule Scenario.Repo.Migrations.AddReferencesFeatures do
  use Ecto.Migration

  def change do
    alter table(:features) do
      add :project_id, references(:projects)
    end
  end
end
