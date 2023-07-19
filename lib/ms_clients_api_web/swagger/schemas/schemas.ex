defmodule MsClientsApiWeb.Swagger.Schemas do
  alias OpenApiSpex.Schema

  defmodule Client do
    require OpenApiSpex

    OpenApiSpex.schema(%{
      # The title is optional. It defaults to the last section of the module name.
      # So the derived title for MyApp.User is "User".
      title: "Client",
      description: "A client of the app",
      type: :object,
      properties: %{
        id: %Schema{type: :integer, description: "Client ID"},
        name: %Schema{type: :string, description: "Client name", pattern: ~r/[a-zA-Z][a-zA-Z0-9_]+/},
        email: %Schema{type: :string, description: "Email address", format: :email},
        document: %Schema{type: :string, description: "Client document"},
        status: %Schema{type: :string, description: "Status client"},
        inserted_at: %Schema{
          type: :string,
          description: "Creation timestamp",
          format: :"date-time"
        },
        updated_at: %Schema{type: :string, description: "Update timestamp", format: :"date-time"}
      },
      required: [:name, :email],
      example: %{
        "id" => 1,
        "name" => "Gabriel Cardoso",
        "email" => "gabrielcardoso@email.com",
        "document" => "123456789",
        "status" => "inadimplente",
        "inserted_at" => "2023-09-12T12:34:55Z",
        "updated_at" => "2023-09-13T10:11:12Z"
      }
    })
  end

  defmodule ClientResponse do
    require OpenApiSpex

    OpenApiSpex.schema(%{
      title: "ClientResponse",
      description: "Response schema for single user",
      type: :object,
      properties: %{
        data: Client
      },
      example: %{
        "data" => %{
          "id" => 123,
          "name" => "Gabriel Cardoso",
          "email" => "gabrielcardoso@email.com",
          "document" => "123456789",
          "status" => "inadimplente",
          "inserted_at" => "2023-09-12T12:34:55Z",
          "updated_at" => "2023-09-13T10:11:12Z"
        }
      }
    })
  end
end
