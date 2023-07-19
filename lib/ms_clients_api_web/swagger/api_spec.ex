defmodule MsClientsApiWeb.ApiSpec do
  alias OpenApiSpex.{Components, Info, OpenApi, Paths, Server}
  alias MsClientsApiWeb.{Endpoint, Router}
  @behaviour OpenApi

  @impl OpenApi
  def spec do
    %OpenApi{
      servers: [
        # Populate the Server info from a phoenix endpoint
        Server.from_endpoint(Endpoint)
      ],
      info: %Info{
        title: to_string(Application.spec(:ms_clients_api, :description)),
        version: to_string(Application.spec(:ms_clients_api, :vsn))
      },
      # Populate the paths from a phoenix router
      paths: Paths.from_router(Router)
      
      # components: %Components{
      #   securitySchemes: %{"authorization" => %SecurityScheme{type: "http", scheme: "bearer"}}
      # },
      # security: [%{"authorization" => []}]
    }
    |> OpenApiSpex.resolve_schema_modules() # Discover request/response schemas from path specs
  end
end
