defmodule ScenarioWeb.LiveHelpers do
  import Phoenix.LiveView.Helpers

  @doc """
  Renders a component inside the `ScenarioWeb.ModalComponent` component.

  The rendered modal receives a `:return_to` option to properly update
  the URL when the modal is closed.

  ## Examples

      <%= live_modal @socket, ScenarioWeb.FeatureLive.FormComponent,
        id: @feature.id || :new,
        action: @live_action,
        feature: @feature,
        return_to: Routes.feature_index_path(@socket, :index) %>
  """
  def live_modal(socket, component, opts) do
    path = Keyword.fetch!(opts, :return_to)
    modal_opts = [id: :modal, return_to: path, component: component, opts: opts]
    live_component(socket, ScenarioWeb.ModalComponent, modal_opts)
  end
end
