defmodule MsClientsApi.Repo.Migrations.AddNewFieldsToClient do
  use Ecto.Migration

  def change do
    alter table(:clients) do
      add :document, :string
      add :status, :string
    end
  end
end
