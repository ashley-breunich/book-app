'use strict'

require('dotenv').config();

// Application Dependencies
const express = require('express');
const pg = require('pg');

// Application Setup
const app = express();
const PORT = process.env.PORT;

// Database Setup
const client = new pg.Client(process.env.DATABASE_URL);
client.connect();
client.on('error', err => console.error(err));

// Serve static files
app.use(express.static('public'));

// Set the view engine for server-side templating
app.set('view engine', 'ejs');

app.get('/', getBooks);
app.get('/hello', getHello);
app.get('/books', getBooks);
app.get('/books/:id', getSingleBook);
app.get('*', getError);

app.listen(PORT, () => console.log('Listening on PORT', PORT));

function getHello(request,response) {
  response.render('pages/hello.ejs');
}

function getBooks(request,response) {
  client.query(`
      SELECT id, author, title, image_url
      FROM books;
    `)
    .then(result => {
      response.render('index', {books : result.rows});
    });
}

function getSingleBook(request, response) {
  let SQL =`SELECT id, author, title, isbn, image_url, description
  FROM books
  WHERE id = $1;`
  let values = [request.params.id];
  client.query(SQL, values)
    .then(result => {
      response.render('show', {singlebook: result.rows});
    });
}

function getError(request, response) {
  response.render('pages/error');
}