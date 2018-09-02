'use strict'

require('dotenv').config();

// Application Dependencies
const express = require('express');
const pg = require('pg');
const superagent = require('superagent');

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
app.get('/searches/new', newSearch);
app.post('/books', postBook);
app.post('/searches', apiSearch);
app.put('/books/:id', updateBook);

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
      response.render('pages/books/show', {books: result.rows[0], message: ''});
    });
}

function postBook(request, response) {
  console.log('body=equals', request.body);
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
        .then(result => response.render('pages/books/show', {books : result.rows[0], message : `This book has been added to your saved list!`}))
        .catch(getError);
    })
    .catch(getError);
}

function apiSearch(request, response) {
  let url = 'https://www.googleapis.com/books/v1/volumes'
  let query = '';
  let modifiedRequest = request.body.search[0].split(' ').join('+');

  if (request.body.search[1] === 'title') query += `+intitle:${modifiedRequest}`;
  if (request.body.search[1] === 'author') query += `+inauthor:${modifiedRequest}`;

  superagent.get(url)
    .query({'q': query})
    .then(apiResponse => apiResponse.body.items.map(bookResult => {
      let { title, subtitle, authors, industryIdentifiers, imageLinks, description } = bookResult.volumeInfo;
      
      let placeholderImage = 'http://www.newyorkpaddy.com/images/covers/NoCoverAvailable.jpg';

      return {
        title: title ? title : 'No title available',
        subtitle: subtitle ? subtitle : '',
        author: authors ? authors[0] : 'No authors available',
        isbn: industryIdentifiers ? `ISBN_13 ${industryIdentifiers[0].identifier}` : 'No ISBN available',
        image_url: imageLinks ? imageLinks.smallThumbnail : placeholderImage,
        description: description ? description : 'No description available',
        id: industryIdentifiers ? `${industryIdentifiers[0].identifier}` : '',
      };
    }))
    .then(bookInfo => response.render('pages/searches/show', {results: bookInfo}))
    .catch(getError);
}

function updateBook(request, response) {
  let {title, author, isbn, image_url, description} = request.body;
  let SQL = `UPDATE books SET title=$1, author=$2, isbn=$3, image_url=$4, description=$5 WHERE id=$6;`;
  let values = [title, author, isbn, image_url, description, request.params.id];

  return client.query(SQL, values)
    .then(response.render('pages/books/show', {book: {}, message: 'Your book has been updated!'}))
    .catch(getError);
}

function newBook(request, response) {
  response.render('pages/books/new');
}

function newSearch(request, response) {
  response.render('pages/searches/new');
}

function getError(request, response) {
  response.render('pages/error');
}
