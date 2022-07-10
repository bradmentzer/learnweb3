# The Graph

Specification based around HTTP on how you get resources from a server

Alternative to REST endpoints

Uses a single endpoint and data you get back is based on the query, not the endpoint you send the data to.

- REST API

  - Gets all the data from endpoints over multiple calls
  - /authors
  - /authors/:id/books

- Graph
  - Compose a query of the data needed
  - query {
    authors{
    name
    books {
    name
    }
    }
    }
    - one query to the /graphql server will give all important information and nested information

Servers can be built with nodeJS and Express and can be used to make CRUD apps

## Dependencies

- Express
- Express-graphql
- Graphql
- Nodemon

go to http://localhost:5000/graphql to access library tool

inside of objects are fiels which are the differenct sections of an object that can be querried to return data. Resolve functions states how to return the information in the field.
