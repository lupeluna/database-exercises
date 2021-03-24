use albums_db;

select database();


describe albums;

-- 31 rows

select distinct artist
from albums;

-- id is the primary key

select release_date
	from `albums`
	order by `release_date`;
	
	-- oldest date is 1967. newest 2011
	
-- 4a. The name of all albums by Pink Floyd
	
	
select name 
from albums
where artist = 'pink floyd';

-- The Dark side of the moon and the wall


select release_date
from albums
where name = "sgt. pepper's lonely hearts club band";

-- 1967

select genre
from albums
where name = "nevermind";

--  Grunge, Alternative rock


--  d. Which albums were released in the 1990s

select name
from albums
	where release_date between 1990 and 1999;
	
--  The Bodyguard Jagged Little Pill Come On Over Falling into You Let's Talk About Love Dangerous The Immaculate Collection Titanic: Music from the Motion Picture Metallica Nevermind Supernatural
	
-- e. Which albums had less than 20 million certified sales

select name
	from albums
	where sales > 20;


-- Thriller. Back in Black. The Dark Side of the Moon Bat Out of Hell The Bodyguard Their Greatest Hits (19711975) Saturday Night Fever Rumours Led Zeppelin IV Jagged Little Pill Come On Over Falling into You Hotel California 21 1 Metallica Supernatural  Appetite for Destruction


-- f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?  because they have different characters/.

