defmodule Scenario.Automations.Feature do
  use Ecto.Schema
  import Ecto.Changeset

  schema "features" do
    field :description, :string
    field :feature, :string

    timestamps()
  end

  @doc false
  def changeset(feature, attrs) do
    feature
    |> cast(attrs, [:feature, :description])
    |> validate_required([:feature, :description])
  end
end
