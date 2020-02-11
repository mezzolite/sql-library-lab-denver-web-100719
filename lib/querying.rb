def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, year 
    FROM books
    JOIN series
    ON series_id = series.id
    WHERE series.id = (SELECT id FROM series LIMIT 1)
    ORDER BY year ASC
  
  "
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto
    FROM characters
    ORDER BY LENGTH(motto) DESC
    LIMIT 1
  "
end


def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(id) AS species_count
    FROM characters
    GROUP BY species
    ORDER BY species_count DESC
    LIMIT 1
  
  "
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
    FROM authors
    INNER JOIN series 
    ON authors.id = series.author_id
    JOIN subgenres ON series.subgenre_id = subgenres.id
  "
end

def select_series_title_with_most_human_characters
  "SELECT title
    FROM series
    JOIN authors
    ON series.author_id = authors.id
    JOIN characters
    ON characters.author_id = authors.id
    WHERE characters.species = 'human'
    GROUP BY series.title
    ORDER BY COUNT(series.id) DESC
    LIMIT 1
  "
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(character_books.book_id) AS book_appearance_count
  FROM characters
  INNER JOIN character_books
  ON characters.id = character_books.character_id
  GROUP BY characters.name
  ORDER BY book_appearance_count DESC
  "
end
