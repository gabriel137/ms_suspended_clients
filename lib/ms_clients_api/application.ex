defmodule MsClientsApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MsClientsApiWeb.Telemetry,
      # Start the Ecto repository
      MsClientsApi.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: MsClientsApi.PubSub},
      # Start Finch
      {Finch, name: MsClientsApi.Finch},
      # Start the Endpoint (http/https)
      MsClientsApiWeb.Endpoint
      # Start a worker by calling: MsClientsApi.Worker.start_link(arg)
      # {MsClientsApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MsClientsApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MsClientsApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
