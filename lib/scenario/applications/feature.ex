defmodule Scenario.Applications.Feature do
  use Ecto.Schema
  import Ecto.Changeset

  schema "features" do
    field :feature, :string
    field :scenario, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(feature, attrs) do
    feature
    |> cast(attrs, [:feature, :scenario, :status])
    |> validate_required([:feature, :scenario, :status])
  end
end
