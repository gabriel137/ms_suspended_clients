defmodule MsClientsApi.Clients.Client do
  use Ecto.Schema
  import Ecto.Changeset

  @required [:name, :email, :document]
  @optional [:status]

  schema "clients" do
    field :name, :string
    field :email, :string
    field :document, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client = []
    sell = []


    client
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
  end
end
