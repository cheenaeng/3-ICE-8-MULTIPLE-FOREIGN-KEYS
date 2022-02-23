DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS collections;
DROP TABLE IF EXISTS paintings;


CREATE TABLE artists (id SERIAL PRIMARY KEY, artist_name TEXT, nationality TEXT);

CREATE TABLE paintings (id SERIAL PRIMARY KEY, painting_name TEXT);

CREATE TABLE collections
(id SERIAL PRIMARY KEY, 
collection_name TEXT, 
painting_id INTEGER, 
constraint fk_painting
  FOREIGN KEY(painting_id)
  REFERENCES paintings(id)
  ON DELETE CASCADE,

artist_id INTEGER,
constraint fk_artist
  FOREIGN KEY(artist_id)
  REFERENCES artists(id)
  ON DELETE CASCADE

);

INSERT INTO artists (artist_name,nationality) VALUES 
('Hans Hofmann', ' American'),
('Anne Ryan', 'American'),
('Jacques Villon','French');
INSERT INTO paintings (painting_name) VALUES 
('The Wind'),
('The Garden'),
('Untitled'),
('The Dining Table');
INSERT INTO collections (collection_name, painting_id, artist_id) VALUES ('Cubist',1,1), ('Cubist',2,1), ('Cubist',3,2), ('Cubist',4,3);

SELECT collections.id AS collection_id, collections.collection_name,artists.id AS artists_id, artist_name, paintings.id AS paintings_id, painting_name
FROM artists
INNER JOIN collections
ON collections.artist_id = artists.id 
INNER JOIN paintings
ON collections.painting_id = paintings.id
WHERE collection_name = 'Cubist';

//node index.js new-collection <COLLECTION_NAME> <PAINTING_ID> [<PAINTING_ID> ...]