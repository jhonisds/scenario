defmodule Scenario.Automations do
  @moduledoc """
  The Automations context.
  """

  import Ecto.Query, warn: false
  alias Scenario.Repo

  alias Scenario.Automations.Feature

  @doc """
  Returns the list of features.

  ## Examples

      iex> list_features()
      [%Feature{}, ...]

  """
  def list_features do
    Feature
    |> Repo.all()
    |> Repo.preload(:project)
  end

  @doc """
  Gets a single feature.

  Raises `Ecto.NoResultsError` if the Feature does not exist.

  ## Examples

      iex> get_feature!(123)
      %Feature{}

      iex> get_feature!(456)
      ** (Ecto.NoResultsError)

  """
  def get_feature!(id) do
    Feature
    |> Repo.get!(id)
    |> Repo.preload(:project)
  end

  @doc """
  Creates a feature.

  ## Examples

      iex> create_feature(%{field: value})
      {:ok, %Feature{}}

      iex> create_feature(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_feature(attrs \\ %{}) do
    %Feature{}
    |> Feature.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a feature.

  ## Examples

      iex> update_feature(feature, %{field: new_value})
      {:ok, %Feature{}}

      iex> update_feature(feature, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_feature(%Feature{} = feature, attrs) do
    feature
    |> Feature.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a feature.

  ## Examples

      iex> delete_feature(feature)
      {:ok, %Feature{}}

      iex> delete_feature(feature)
      {:error, %Ecto.Changeset{}}

  """
  def delete_feature(%Feature{} = feature) do
    Repo.delete(feature)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking feature changes.

  ## Examples

      iex> change_feature(feature)
      %Ecto.Changeset{data: %Feature{}}

  """
  def change_feature(%Feature{} = feature, attrs \\ %{}) do
    Feature.changeset(feature, attrs)
  end

  def search_feature_by_name(feature) do
    :timer.sleep(1000)

    list_features()
    |> Enum.filter(&(&1.feature == feature))
  end

  def list_description do
    for project <- list_features(), do: project.description |> to_string()
  end

  def suggest(""), do: []

  def suggest(prefix) do
    Enum.filter(list_description(), &has_prefix?(&1, prefix))
  end

  defp has_prefix?(description, prefix) do
    String.starts_with?(String.downcase(description), String.downcase(prefix))
  end
end
