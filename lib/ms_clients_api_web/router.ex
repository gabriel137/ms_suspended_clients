defmodule MsClientsApiWeb.Router do
  use MsClientsApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :api_swagger do
    plug :accepts, ["json"]
    plug OpenApiSpex.Plug.PutApiSpec, module: MsClientsApiWeb.ApiSpec
  end

  scope "/api", MsClientsApiWeb do
    pipe_through :api

    resources "/clients", ClientController, except: [:new, :edit]
    get "/swaggerui", OpenApiSpex.Plug.SwaggerUI, path: "/v1/openapi"
  end

  scope "/v1" do
    pipe_through :api_swagger

    get "/openapi", OpenApiSpex.Plug.RenderSpec, []
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:ms_clients_api, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: MsClientsApiWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
