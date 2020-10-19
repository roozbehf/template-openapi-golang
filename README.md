# Golang Service with OpenAPI 

This is a template project for developing a REST API service in Golang based on an OpenAPI 3.0 specification. 

## Flow

### Generation
Use `make api-generate` to generate server code based on the OpenAPI spec in `./openapi/server.yml`. 

### Coding
Add your functional logic in `./server/api_default_service.go`. 

### Run
Go into `./server` and run 
```
make run
```
The default port will be 8080. 



