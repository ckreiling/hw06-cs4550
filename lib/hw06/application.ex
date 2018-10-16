defmodule Hw06.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      Hw06.Repo,
      # Start the endpoint when the application starts
      Hw06Web.Endpoint
      # Starts a worker by calling: Hw06.Worker.start_link(arg)
      # {Hw06.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Hw06.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Hw06Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
