# Golang Service with OpenAPI 

This is a template project for developing a REST API service in Golang based on an OpenAPI 3.0 specification. 

## Flow

### Generation
Use `make api-generate` to generate server code based on the OpenAPI spec in `./openapi/server.yml`. 

### Coding
1. Add your functional logic in `./server/api_default_service.go`. 
2. Make sure you add this file (and any other you change) to `./server/.openapi-generator-ignore` so that future calls to the generator does not overwrite you changes. 

#### Notes
1. *Protecting your changes*: Test your setup once before you dive into coding and make sure that you added the correct line in your `.openapi-generator-ignore` file. 

2. *Golang Contexts*: The generator does not currently support Golang contexts. While this has to be eventually added in `./server/api_default.go`, to limit the scope of your changes for now, consider creating a context and passing it on in your controller functions in `./server/api_default_service.go`. 

### Run
Go into `./server` and run 
```
make run
```
The default port will be 8080. 



