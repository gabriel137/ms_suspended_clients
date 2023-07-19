defmodule MsClientsApiWeb.ClientController do
  use MsClientsApiWeb, :controller
  use OpenApiSpex.ControllerSpecs

  alias MsClientsApi.Clients
  alias MsClientsApi.Clients.Client

  action_fallback MsClientsApiWeb.FallbackController

  def index(conn, _params) do
    clients = Clients.list_clients()
    render(conn, :index, clients: clients)
  end

  def create(conn, %{"client" => client_params}) do
    with {:ok, %Client{} = client} <- Clients.create_client(client_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/clients/#{client}")
      |> render(:show, client: client)
    end
  end

  def show(conn, %{"id" => id}) do
    client = Clients.get_client!(id)
    render(conn, :show, client: client)
  end


  tags ["clients"]
  security [%{}, %{"petstore_auth" => ["write:users", "read:users"]}]

  operation :update,
    summary: "Update client",
    parameters: [
      id: [in: :path, description: "Client ID", type: :integer, example: 1001]
    ],
    request_body: {"Client params", "application/json", Client},
    responses: [
      ok: {"Client response", "application/json", ClientResponse}
    ]

  def update(conn, %{"id" => id, "client" => client_params}) do
    client = Clients.get_client!(id)

    with {:ok, %Client{} = client} <- Clients.update_client(client, client_params) do
      render(conn, :show, client: client)
    end
  end

  def delete(conn, %{"id" => id}) do
    client = Clients.get_client!(id)

    with {:ok, %Client{}} <- Clients.delete_client(client) do
      send_resp(conn, :no_content, "")
    end
  end
end
