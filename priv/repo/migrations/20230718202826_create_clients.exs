defmodule MsClientsApi.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :name, :string
      add :email, :string

      timestamps()
    end
  end
end
