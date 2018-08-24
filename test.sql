CREATE TABLE IF NOT EXISTS
    books (
      id SERIAL PRIMARY KEY,
      author VARCHAR(255),
      title VARCHAR(255),
      isbn VARCHAR(255),
      image_url VARCHAR(255), 
      description TEXT
    );

INSERT INTO books
VALUES
(DEFAULT, 'Hunter S. Thompson', 'The Rum Diary', 'ISBN_13 9781451659719', 'http://books.google.com/books/content?id=c5tMZGbhCkEC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'The irreverent writer''s long lost novel, written before his nonfiction became popular, chronicles a journalist''s enthusiastic, drunken foray through 1950s San Juan.');

INSERT INTO books
VALUES
(DEFAULT, 'Ernesto Guevara', 'The Motorcycle Diaries', 'ISBN_13 9781876175702', 'http://books.google.com/books/content?id=DzJnT-_OQtAC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'This new, expanded edition features exclusive, unpublished photographs taken by the 23-year-old Ernesto on his journey across a continent, and a tender preface by Aleida Guevara offering a highly insightful perspective on her father the man ...');

INSERT INTO books
VALUES
(DEFAULT, 'J.R.R Tolkein', 'The Fellowship of the Ring', 'ISBN_13 9780007522903', 'http://books.google.com/books/content?id=f3q6mwEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api
http://books.google.com/books/content?id=f3q6mwEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api
', 'This edition features the complete story with a sumptuous cover design and brand new reproductions of all of Tolkien''s original drawings and maps.');

INSERT INTO books
VALUES
(DEFAULT, 'Katsuhiro Ōtomo', 'Akira', 'ISBN_13 9781632364616', 'http://books.google.com/books/content?id=jhsItAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api
http://books.google.com/books/content?id=jhsItAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api
', 'Katsuhiro Otomo''s stunning science fiction masterpiece is considered by many to be the finest work of graphic fiction ever produced, and Otomo''s brilliant animated film version is regarded worldwide as a classic.');

INSERT INTO books
VALUES
(DEFAULT, 'Anthony Burgess', 'A Clockwork Orange', 'ISBN_13 9780393343045', 'http://books.google.com/books/content?id=bgpJn-Oq22MC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api
http://books.google.com/books/content?id=bgpJn-Oq22MC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api
', 'When the state undertakes to reform Alex to ''redeem'' him, the novel asks, ''At what cost?'' This edition includes the controversial last chapter not published in the first edition and Burgess''s introduction.');

INSERT INTO books
VALUES
(DEFAULT, 'Gillian Flynn', 'Sharp Objects', 'ISBN_13 9780307341556', 'http://books.google.com/books/content?id=cAYy9_aV4kMC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api
http://books.google.com/books/content?id=cAYy9_aV4kMC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api
', 'Reluctantly returning to her hometown after an eight-year absence to investigate the murders of two preteen girls, reporter Camille Preaker is reunited with her neurotic mother and enigmatic, thirteen-year-old half-sister as she works to ...');

INSERT INTO books
VALUES
(DEFAULT, 'Frank Herbert', 'Dune', 'ISBN_13 9780441013593', 'http://books.google.com/books/content?id=B1hSG45JCX4C&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Follows the adventures of Paul Atreides, the son of a betrayed duke given up for dead on a treacherous desert planet and adopted by its fierce, nomadic people, who help him unravel his most unexpected destiny.');

INSERT INTO books
VALUES
(DEFAULT, 'Stephen King', 'The Shining', 'ISBN_13 9780385528863', 'http://books.google.com/books/content?id=8VnJLu3AvvQC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'With an excerpt from the sequel, Doctor Sleep. Terrible events occur at an isolated hotel in the off season, when a small boy with psychic powers struggles to hold his own against the forces of evil that are driving his father insane.');

INSERT INTO books
VALUES
(DEFAULT, 'Harper Lee', 'To Kill a Mockingbird', 'ISBN_13 9780062369635', 'http://books.google.com/books/content?id=-D8WBAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'One of the best-loved stories of all time, To Kill a Mockingbird has been translated into more than forty languages, sold more than forty million copies worldwide, served as the basis for an enormously popular motion picture, and was voted one of the best novels of the twentieth century by librarians across the country. A gripping, heart-wrenching, and wholly remarkable tale of coming-of-age in a South poisoned by virulent prejudice, it views a world of great beauty and savage inequities through the eyes of a young girl, as her father—a crusading local lawyer—risks everything to defend a black man unjustly accused of a terrible crime.');

INSERT INTO books
VALUES
(DEFAULT, 'Sylvia Plath', 'The Bell Jar', 'ISBN_13 9780062444479', 'http://books.google.com/books/content?id=G-f1CQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'Sylvia Plath''s shocking, realistic, and intensely emotional novel about a woman falling into the grip of insanity Esther Greenwood is brilliant, beautiful, enormously talented, and successful, but slowly going under—maybe for the last time. In her acclaimed and enduring masterwork, Sylvia Plath brilliantly draws the reader into Esther''s breakdown with such intensity that her insanity becomes palpably real, even rational—as accessible an experience as going to the movies. A deep penetration into the darkest and most harrowing corners of the human psyche, The Bell Jar is an extraordinary accomplishment and a haunting American classic.');

UPDATE books
SET image_url = 'http://books.google.com/books/content?id=wnFaWMxXbhMC&printsec=frontcover&img=1&zoom=2&edge=curl&source=gbs_api'
WHERE id=1;

UPDATE books
SET image_url = 'http://books.google.com/books/content?id=DzJnT-_OQtAC&printsec=frontcover&img=1&zoom=2&edge=curl&source=gbs_api'
WHERE id=2;

UPDATE books
SET image_url = 'http://books.google.com/books/content?id=I8mxughWAOEC&printsec=frontcover&img=1&zoom=2&edge=curl&source=gbs_api'
WHERE id=3;

UPDATE books
SET image_url = 'http://books.google.com/books/content?id=PSBdDwAAQBAJ&printsec=frontcover&img=1&zoom=2&edge=curl&source=gbs_api'
WHERE id=4;

UPDATE books
SET image_url = 'http://books.google.com/books/content?id=bgpJn-Oq22MC&printsec=frontcover&img=1&zoom=2&edge=curl&source=gbs_api'
WHERE id=5;

UPDATE books
SET image_url = 'http://books.google.com/books/content?id=cAYy9_aV4kMC&printsec=frontcover&img=1&zoom=2&edge=curl&source=gbs_api'
WHERE id=6;

UPDATE books
SET image_url = 'http://books.google.com/books/content?id=ydQiDQAAQBAJ&printsec=frontcover&img=1&zoom=2&edge=curl&source=gbs_api'
WHERE id=7;

UPDATE books
SET image_url = 'http://books.google.com/books/content?id=8VnJLu3AvvQC&printsec=frontcover&img=1&zoom=2&edge=curl&source=gbs_api'
WHERE id=8;

UPDATE books
SET image_url = 'http://books.google.com/books/content?id=-D8WBAAAQBAJ&printsec=frontcover&img=1&zoom=2&edge=curl&source=gbs_api'
WHERE id=9;

UPDATE books
SET image_url = 'http://books.google.com/books/content?id=mf88CwAAQBAJ&printsec=frontcover&img=1&zoom=2&source=gbs_api'
WHERE id=10;