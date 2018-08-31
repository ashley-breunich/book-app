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
app.use(express.urlencoded({ extended: true }));
app.use(express.static('public'));

// Set the view engine for server-side templating
app.set('view engine', 'ejs');

app.get('/', getBooks);
app.get('/hello', getHello);
app.get('/books', getBooks);
app.get('/books/:id', getSingleBook);
app.get('/new', newBook);
app.post('/books', postBook);

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
      response.render('show', {books: result.rows[0], message: ''});
    });
}

function postBook(request, response) {
  let {author, title, isbn, image_url, description} = request.body;
  let SQL = `INSERT INTO books
  (author, title, isbn, image_url, description)
  VALUES ($1, $2, $3, $4, $5);`;
  let values = [author, title, isbn, image_url, description];
  return client.query(SQL, values)
    .then(() => {
      SQL = `SELECT * FROM books WHERE isbn=$1;`;
      values = [request.body.isbn];
      return client.query(SQL, values)
        .then(result => response.render('show', {books : result.rows[0], message : `This book has been added to your saved list!`}))
        .catch(getError);
    })
    .catch(getError);
}

function newBook(request, response) {
  response.render('new');
}

function getError(request, response) {
  response.render('pages/error');
}
