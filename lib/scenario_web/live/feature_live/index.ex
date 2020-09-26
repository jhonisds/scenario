defmodule ScenarioWeb.FeatureLive.Index do
  use ScenarioWeb, :live_view

  alias Scenario.Applications
  alias Scenario.Applications.Feature

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :features, list_features())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Feature")
    |> assign(:feature, Applications.get_feature!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Feature")
    |> assign(:feature, %Feature{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Features")
    |> assign(:feature, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    feature = Applications.get_feature!(id)
    {:ok, _} = Applications.delete_feature(feature)

    {:noreply, assign(socket, :features, list_features())}
  end

  defp list_features do
    Applications.list_features()
  end
end
