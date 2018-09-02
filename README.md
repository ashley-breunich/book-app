# 301n11 Book App

**Author**: Matt McQuain & Ashley Breunich
**Version**: 4.0.0

## Overview
<!-- Provide a high level overview of what this application is and why you are building it, beyond the fact that it's an assignment for a Code Fellows 301 class. (i.e. What's your problem domain?) -->

Version 1.0.0 - In this application, we wanted to demonstrate our ability to do server-side templating using EJS. We implemented a basic full stack application for a list of books, which would then render books from a PostgresSQL database. However, this initial deployment of our application deals more with storing book objects in a database that our client can then make requests from, which is then rendered as a list in the client's browser. 

Version 2.0.0 - In our latest iteration of the book application, we wanted to add the ability for the users to see the details of a single book (in a new view). We also modified our code base to be modular, allowing us to have much dryier code. 

Version 3.0.0 - This update gives the ability for the user to add a new book to their database by filling in a form, allowing for continuous growth of their collection. Feedback is provided to the user upon successful (or lack there of) additon of said book to their database. Further styling and UI/UX improvements of the application was done. 

## Getting Started
<!-- What are the steps that a user must take in order to build this app on their own machine and get it running? -->

Version 1.0.0 - They would need to run quite a few different sets of software to build and deploy the application. These include, but are not limited to, running PSQL, Jest, npm, and liveserver. However, if the client simply wants to browse the application, they can simply go to https://ab-mm-booklist.herokuapp.com/ once it's live.

Version 2.0.0 - No new features added that would require additional software.

Version 3.0.0 - Understanding of HTML5 and form validation, as well as an understanding of version 1.0.0 and it's associated software.

## Architecture
<!-- Provide a detailed description of the application design. What technologies (languages, libraries, etc) you're using, and any other relevant design information. -->

Version 1.0.0 - We used multiple software applications to build this site. Primary development was done with Visual Studio Code. Repositories were set up via GitHub, and our application was deployed using Heroku. Our book database was configured using PostgreSQL. We also focused on a "mobile first" approach, ensuring proper use of SMACCS principles.

Version 2.0.0 - We added an endpoint for a GET request to /books/:id, allowing the user to click on a "details" button and view data points about the book queried. Consistent rendering was done by moving our SQL queries and view rendering into callbacks, and "partials" folders were populated with files that are the same across each view. Styling of the application was implimented using SMACCS principles. 

Version 3.0.0 - Adding a new book to the users collection required us to impliment HTML5 form validation. To added a new book, we created an ejs containing a form in which users are able to enter the details of their new book. A hamburger menu was added to ensure users could access the navigation portion of the page, regardless of their display width.    

## Credits and Collaborations
<!-- Give credit (and a link) to other people or resources that helped you build this application. -->

Collaborators
Ashley Breunich @ https://github.com/ashley-breunich
Matt McQuain @ https://github.com/mattoattacko

Resources
http://ejs.co/
https://jestjs.io/#use
https://google.com so many googles
https://stackoverflow.com/ all of it
https://devcenter.heroku.com/articles/heroku-postgresql
https://developer.mozilla.org/en-US/docs/Web/HTML/Element/form
https://developer.mozilla.org/en-US/docs/Learn/HTML/Forms/Form_validation#Using_built-in_form_validation
JB: Google Sensei 
-->