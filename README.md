# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
** Please configure database.yml by creating database.yml using database_sample.yml
Online book Shop

1) List books
    
    GET /api/v1/books

    Request params: { books: { name: 'Meluha', author: 'Amish'}}
    Response
    {"id":3,"name":"Meluha","price":10.0,"author":"Amish","year":"2020-01-01","available_copies":23,"is_deleted":false,"created_at":"2022-09-04T05:58:17.395Z","updated_at":"2022-09-04T05:58:17.395Z"}

2)Update book
    
  PUT /api/v1/books/:id
  Request params = { available_copies: 25}


3)View a book

  GET /api/v1/books/:id
  Request params =  = { id: 1}

4)Create book

  POST /api/v1/books
  Request params: { books: { name: 'Meluha', price: '10.00', author: 'Amish', year: '2020-01-01', available_copies: 500 }}

5)Delete book

   DELETE /api/v1/books/:id
   Request params = { id: 1}

6)View all the orders

  GET /api/v1/orders
  Response : 
  [{"id":1,"receipient_email":"abc@email","receipient_address":"Address1","receipient_contact_number":"1231","expected_delivery_date":"2020-01-01","comments":"Comment1","invoice_number":"21313","total_charge":10.5,"status":"ORDERED","created_at":"2022-09-02T11:55:55.436Z","updated_at":"2022-09-02T11:55:55.436Z"},{"id":2,"receipient_email":"azd@email","receipient_address":"Address2","receipient_contact_number":"234234","expected_delivery_date":"2020-01-01","comments":"Comment2","invoice_number":"23424","total_charge":10.8,"status":"ORDERED","created_at":"2022-09-02T11:56:14.316Z","updated_at":"2022-09-02T11:56:14.316Z"}]

7) Order history for specific book

  GET /api/v1/books/:id/order_history  
  Request params = { id: 1}
