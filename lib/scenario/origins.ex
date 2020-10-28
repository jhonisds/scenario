defmodule Scenario.Origins do
  @moduledoc """
  The Origins context.
  """

  import Ecto.Query, warn: false
  alias Scenario.Repo

  alias Scenario.Origins.Project

  @doc """
  Returns the list of projects.

  ## Examples

      iex> list_projects()
      [%Project{}, ...]

  """
  def list_projects do
    Repo.all(Project)
  end

  @doc """
  Returns the list of projects by name.

  ## Examples

      iex> list_projects_by_name()
      [%Project{}, ...]

  """
  def list_projects_by_name do
    for project <- list_projects(), do: {project.name, project.id}
  end

  @doc """
  Gets a single project.

  Raises `Ecto.NoResultsError` if the Project does not exist.

  ## Examples

      iex> get_project!(123)
      %Project{}

      iex> get_project!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project!(id), do: Repo.get!(Project, id)

  @doc """
  Creates a project.

  ## Examples

      iex> create_project(%{field: value})
      {:ok, %Project{}}

      iex> create_project(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project(attrs \\ %{}) do
    %Project{}
    |> Project.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a project.

  ## Examples

      iex> update_project(project, %{field: new_value})
      {:ok, %Project{}}

      iex> update_project(project, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project(%Project{} = project, attrs) do
    project
    |> Project.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a project.

  ## Examples

      iex> delete_project(project)
      {:ok, %Project{}}

      iex> delete_project(project)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project(%Project{} = project) do
    Repo.delete(project)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project changes.

  ## Examples

      iex> change_project(project)
      %Ecto.Changeset{data: %Project{}}

  """
  def change_project(%Project{} = project, attrs \\ %{}) do
    Project.changeset(project, attrs)
  end

  @doc """
  Returns an single project by name.

  ## Examples

      iex> search_project(name)
      %Project{}

  """
  def search_project(name) do
    :timer.sleep(1000)

    list_projects()
    |> Enum.filter(&(&1.name == name))

    # |> Enum.filter(fn x -> x.name == name end)
  end

  def list_by_name do
    for project <- list_projects(), do: project.name
  end

  def suggest(""), do: []

  def suggest(prefix) do
    Enum.filter(list_by_name(), &has_prefix?(&1, prefix))
  end

  defp has_prefix?(name, prefix) do
    String.starts_with?(String.downcase(name), String.downcase(prefix))
  end
end
