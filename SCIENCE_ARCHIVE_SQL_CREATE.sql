CREATE DATABASE SCIENCE_ARCHIVE;
USE SCIENCE_ARCHIVE;

/* Creating a table to store the type of publications (journal/thesis/book/conference paper) */
CREATE TABLE publication_item (
  item_id int NOT NULL AUTO_INCREMENT, 
  item_type varchar(255) NOT NULL, 
  PRIMARY KEY (item_id)
);

/*creating table for storing article data. Regex has used to limit the abstract words count to maximum of 800 */
CREATE TABLE article_data (
  article_id int NOT NULL AUTO_INCREMENT, 
  item_id int, 
  title varchar(255) NOT NULL, 
  abstract varchar(10000) DEFAULT 'No abstract available', 
  publication_year int, 
  hyperlink varchar(255) NOT NULL, 
  PRIMARY KEY (article_id), 
  FOREIGN KEY (item_id) REFERENCES publication_item(item_id), 
  CONSTRAINT abstract_word_limit CHECK(CHAR_length(Replace(abstract, N' ', N''))>(char_length(abstract) -800))
);

/* creating a table to store Journals data */
CREATE TABLE journal (
  journal_id int NOT NULL AUTO_INCREMENT, 
  journal_title varchar(255) NOT NULL, 
  PRIMARY KEY (journal_id)
);

/* creating table to store conference data */
CREATE TABLE conference (
  conference_id int NOT NULL AUTO_INCREMENT, 
  conference_title varchar(255), 
  PRIMARY KEY (conference_id)
);

/* creating table to store conference paper details */
CREATE TABLE conference_paper (
  conference_paper_id int NOT NULL AUTO_INCREMENT, 
  conference_id int, 
  article_id int, 
  page_number varchar(255), 
  PRIMARY KEY (conference_paper_id), 
  FOREIGN KEY (conference_id) REFERENCES conference(conference_id), 
  FOREIGN KEY (article_id) REFERENCES article_data(article_id)
);

/* creating a table for storing thesis information */
CREATE TABLE thesis (
  thesis_id int NOT NULL AUTO_INCREMENT, 
  article_id int NOT NULL, 
  thesis_type varchar(255) DEFAULT 'N/A', 
  PRIMARY KEY (thesis_id), 
  FOREIGN KEY (article_id) REFERENCES article_data(article_id)
);

/* creating a table to store information about academic institution */
CREATE TABLE academic_institution (
  academic_inst_id int NOT NULL AUTO_INCREMENT, 
  inst_name varchar(255) NOT NULL, 
  street varchar(255) NOT NULL, 
  city varchar(255) NOT NULL, 
  post_code varchar(255) NOT NULL, 
  PRIMARY KEY (academic_inst_id)
);

/* creating table for storing thesis and academic institution relationship */
CREATE TABLE thesis_academic_institution (
  thesis_id int, 
  academic_inst_id int, 
  PRIMARY KEY (thesis_id, academic_inst_id), 
  FOREIGN KEY (thesis_id) REFERENCES thesis(thesis_id), 
  FOREIGN KEY (academic_inst_id) REFERENCES academic_institution(academic_inst_id)
);

/* creating table to store journal paper details */
CREATE TABLE journal_paper (
  journal_paper_id int NOT NULL AUTO_INCREMENT, 
  article_id int, 
  journal_id int, 
  issue_number varchar(255) DEFAULT 'N/A', 
  volume_number varchar(255) DEFAULT 'N/A', 
  page_number varchar(255) DEFAULT 'N/A', 
  PRIMARY KEY (journal_paper_id), 
  FOREIGN KEY (article_id) REFERENCES article_data(article_id), 
  FOREIGN KEY (journal_id) REFERENCES journal(journal_id)
);

/* creating table to store PUBLISHER details */
CREATE TABLE publisher (
  publisher_id int NOT NULL AUTO_INCREMENT, 
  publisher_name varchar(255) NOT NULL, 
  street varchar(255) NOT NULL, 
  city varchar(255) NOT NULL, 
  post_code varchar(255) NOT NULL, 
  PRIMARY KEY (publisher_id)
);

/* creating table for storing keyword/subject/topics of archive papers */
CREATE TABLE keyword (
  keyword_id int NOT NULL AUTO_INCREMENT, 
  keyword_term varchar(255) NOT NULL, 
  PRIMARY KEY (keyword_id)
);
/* creating table for storing reference details */
CREATE TABLE reference_details (
  reference_id int NOT NULL AUTO_INCREMENT, 
  item_id int, 
  reference_title varchar(255) NOT NULL, 
  reference_link varchar(255) UNIQUE NOT NULL, 
  PRIMARY KEY (reference_id), 
  FOREIGN KEY (item_id) REFERENCES publication_item(item_id)
);

/* creating table for establishing the article and reference relationship */
CREATE TABLE article_reference (
  article_id int, 
  reference_id int, 
  PRIMARY KEY (article_id, reference_id), 
  FOREIGN KEY (article_id) REFERENCES article_data(article_id), 
  FOREIGN KEY (reference_id) REFERENCES reference_details(reference_id)
);

/* creating table for storing details of authors and editors */
CREATE TABLE author_editor (
  author_editor_id int NOT NULL AUTO_INCREMENT, 
  fname varchar(255) NOT NULL, 
  lname varchar(255) NOT NULL, 
  email varchar(255) NOT NULL, 
  PRIMARY KEY (author_editor_id)
);

/* creating table for storing details books */
CREATE TABLE book (
  book_id int NOT NULL AUTO_INCREMENT, 
  article_id int, 
  edition varchar(255) DEFAULT 'N/A', 
  PRIMARY KEY (book_id), 
  FOREIGN KEY (article_id) REFERENCES article_data(article_id)
);

/* creating table for storing user information */
CREATE TABLE user_info (
  user_id int NOT NULL AUTO_INCREMENT, 
  username varchar(15) UNIQUE NOT NULL, 
  user_password varchar(25) NOT NULL, 
  user_type varchar(25) NOT NULL, 
  PRIMARY KEY (user_id), 
  CONSTRAINT user_type_check CHECK (
    user_type IN ('Author', 'Reader', 'Both')
  )
);

/* creating tables for storing user profile details */
CREATE TABLE profile (
  user_id int, 
  fname varchar(255) NOT NULL, 
  lname varchar(255) NOT NULL, 
  phone varchar(255) NOT NULL, 
  email varchar(255) UNIQUE NOT NULL, 
  contact_pref varchar(255) NOT NULL, 
  PRIMARY KEY (user_id), 
  FOREIGN KEY (user_id) REFERENCES user_info(user_id), 
  CONSTRAINT contact_pref_check CHECK(
    contact_pref IN ('Email', 'Phone')
  ), 
  CONSTRAINT email_validate CHECK(
    REGEXP_LIKE (
      email, '^[A-Za-z]+[A-Za-z0-9.]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'
    )
  )
);

/* creating table to store all the review scores and review comments from users */
CREATE TABLE review (
  review_id int NOT NULL AUTO_INCREMENT, 
  user_id int, 
  article_id int, 
  review_score int NOT NULL, 
  review_comment varchar(255) DEFAULT '-', 
  PRIMARY KEY (review_id), 
  FOREIGN KEY (user_id) REFERENCES user_info(user_id), 
  FOREIGN KEY (article_id) REFERENCES article_data(article_id), 
  CONSTRAINT prevent_double_review UNIQUE(user_id, article_id)
);

/* creating table to store the series information of a book */
CREATE TABLE series_info (
  series_id int NOT NULL AUTO_INCREMENT, 
  book_id int, 
  series_title varchar(255), 
  series_number int, 
  PRIMARY KEY (series_id), 
  FOREIGN KEY (book_id) REFERENCES book(book_id)
);

/* creating a table to establish connection between user profile and user visited/read articles */
CREATE TABLE user_library (
  user_id int, 
  article_id int, 
  PRIMARY KEY(user_id, article_id), 
  FOREIGN KEY (user_id) REFERENCES user_info(user_id), 
  FOREIGN KEY (article_id) REFERENCES article_data(article_id)
);

/* creating table to establish relation between articles and editors of the article */
CREATE TABLE article_editor (
  article_id int, 
  author_editor_id int, 
  PRIMARY KEY (article_id, author_editor_id), 
  FOREIGN KEY (article_id) REFERENCES article_data(article_id), 
  FOREIGN KEY (author_editor_id) REFERENCES author_editor(author_editor_id)
);

/* creating table to establish relation between articles and authors of the article */
CREATE TABLE article_author (
  article_id int, 
  author_editor_id int, 
  PRIMARY KEY (article_id, author_editor_id), 
  FOREIGN KEY (article_id) REFERENCES article_data(article_id), 
  FOREIGN KEY (author_editor_id) REFERENCES author_editor(author_editor_id)
);

/* creating table to establish relationship between conference papers and publishers */
CREATE TABLE conference_paper_publisher (
  conference_paper_id int, 
  publisher_id int, 
  PRIMARY KEY (
    conference_paper_id, publisher_id
  ), 
  FOREIGN KEY (conference_paper_id) REFERENCES conference_paper(conference_paper_id), 
  FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);

/* creating a  table for establishing relationship between books and publishers */
CREATE TABLE book_publisher (
  publisher_id int, 
  book_id int, 
  PRIMARY KEY (publisher_id, book_id), 
  FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id), 
  FOREIGN KEY (book_id) REFERENCES book(book_id)
);

/* creating a  table for establishing relationship between user profiles and keyword/subjects of interest */
CREATE TABLE user_keyword_interest (
  keyword_id int, 
  user_id int, 
  PRIMARY KEY (keyword_id, user_id), 
  FOREIGN KEY (keyword_id) REFERENCES keyword(keyword_id), 
  FOREIGN KEY (user_id) REFERENCES user_info(user_id)
);

/* this table is created for establishing relationship of keyword/subjects to articles of archive */
CREATE TABLE article_keyword (
  article_id int, 
  keyword_id int, 
  PRIMARY KEY (article_id, keyword_id), 
  FOREIGN KEY (article_id) REFERENCES article_data(article_id), 
  FOREIGN KEY (keyword_id) REFERENCES keyword(keyword_id)
);


