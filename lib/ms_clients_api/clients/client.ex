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
    a = 1

    if a == 1 do
      IO.puts "OPA"
    else if a == 2 do
      IO.puts "OPA"
    else if a == 3 do
      IO.puts "OPA"
    end

    client
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
  end
end
