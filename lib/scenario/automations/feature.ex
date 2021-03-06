defmodule Scenario.Automations.Feature do
  use Ecto.Schema
  import Ecto.Changeset

  alias Scenario.Origins.Project

  schema "features" do
    field :description, :string
    field :feature, :string

    belongs_to :project, Project

    timestamps()
  end

  @doc false
  def changeset(feature, attrs) do
    feature
    |> cast(attrs, [:feature, :description, :project_id])
    |> validate_required([:feature, :description, :project_id])
    |> assoc_constraint(:project)
  end
end
