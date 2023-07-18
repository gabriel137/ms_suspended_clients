defmodule MsClientsApi.Repo do
  use Ecto.Repo,
    otp_app: :ms_clients_api,
    adapter: Ecto.Adapters.Postgres
end
