# Ms Suspended Clients Api

To start the project by Docker

  * Install docker engine
  * Run docker-compose up

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

To test api by cURL:

  Insert a new client:
    
    * Run `curl -X POST -H "Content-Type: application/json" -d '{"client": {"name": "Gabriel", "email": "gabrielcs@example.com", "document": "12345678", "status": "inadiplente"}}' http://localhost:4000/api/clients` to create a new client
    
  
  Get all clients

    * Run `curl http://localhost:4000/api/clients`
  
  Get a client by id

    * Run `curl http://localhost:4000/api/clients/<id_do_cliente>`

  Update client

    * Run `curl -X PUT -H "Content-Type: application/json" -d '{"client": {"name": "Jane Doe"}}' http://localhost:4000/api/clients/<id_do_cliente>`

  Delete client

    * Run `curl -X DELETE http://localhost:4000/api/clients/<client-id>`