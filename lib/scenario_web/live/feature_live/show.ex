defmodule ScenarioWeb.FeatureLive.Show do
  use ScenarioWeb, :live_view

  alias Scenario.Automations

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:feature, Automations.get_feature!(id))}
  end

  defp page_title(:show), do: "Show Feature"
  defp page_title(:edit), do: "Edit Feature"
end
