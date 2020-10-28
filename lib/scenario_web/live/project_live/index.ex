defmodule ScenarioWeb.ProjectLive.Index do
  use ScenarioWeb, :live_view

  alias Scenario.Origins
  alias Scenario.Origins.Project

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:projects, list_projects())
     |> assign(name: "", projects: list_projects(), matches: [], loading: false)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Project")
    |> assign(:project, Origins.get_project!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Project")
    |> assign(:project, %Project{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Projects")
    |> assign(:project, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    project = Origins.get_project!(id)
    {:ok, _} = Origins.delete_project(project)

    {:noreply, assign(socket, :projects, list_projects())}
  end

  def handle_event("suggest-name", %{"prefix" => prefix}, socket) do
    socket = assign(socket, matches: suggest_name(prefix))
    {:noreply, socket}
  end

  def handle_event("name-search", %{"prefix" => name}, socket) do
    send(self(), {:run_name_search, name})

    socket =
      assign(socket,
        name: name,
        projects: [],
        loading: true
      )

    {:noreply, socket}
  end

  @impl true
  def handle_info({:run_name_search, name}, socket) do
    case search(name) do
      [] ->
        socket =
          socket
          |> put_flash(:error, "Project name: \"#{name}\" not found.")
          |> assign(projects: list_projects(), loading: false)

        {:noreply, socket}

      project ->
        socket =
          socket
          |> clear_flash()
          |> assign(projects: project, loading: false)

        {:noreply, socket}
    end
  end

  defp list_projects do
    Origins.list_projects()
  end

  defp search(name) do
    name
    |> Origins.search_project()
  end

  defp suggest_name(prefix) do
    prefix
    |> Origins.suggest()
  end
end
