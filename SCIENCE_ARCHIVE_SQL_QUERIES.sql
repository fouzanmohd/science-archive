/* When a visitor enters the science archive dashboard, the homepage will show all 
the available journals, books, thesis papers and conference papers. Title, abstract 
description, publication paper type, year of publication and link to the paper will 
be visible on dashboard. These can be achieved by the following query. 
(This view is for the guest users, who are not logged into the system ie,
 no recommendation algorithm is working at this moment) */
SELECT 
  ad.title AS 'Title', 
  ad.abstract AS 'Abstract', 
  ad.publication_year AS 'Publication Year', 
  pi.item_type AS 'Paper Type', 
  ad.hyperlink AS 'Link' 
FROM 
  article_data AS ad 
  INNER JOIN publication_item AS pi ON pi.item_id = ad.item_id;
  
/* On the homepage of the dashboard, functionalities for filtering will be available for users.
 Filtering papers based on year of publication and type of paper can be achieved at this page. 
 Above query can be appended by a ‘Where’ condition to implement this feature. Query is given below.
This query gives all the publications done in year of 2010. Based on user’s requirement, 
it can be manipulated with ‘<’, ‘>’,‘<=’, ‘>=’. */
SELECT 
  ad.title AS 'Title', 
  ad.abstract AS 'Abstract', 
  ad.publication_year AS 'Publication Year', 
  pi.item_type AS 'Paper Type', 
  ad.hyperlink AS 'Link' 
FROM 
  article_data AS ad 
  INNER JOIN publication_item AS pi ON pi.item_id = ad.item_id 
WHERE 
  ad.publication_year = 2010;
  
/* For filtering using type of publication, query can be changed into  
All the papers which blongs to books will be visible to user when they use this filter.*/
SELECT 
  ad.title AS 'Title', 
  ad.abstract AS 'Abstract', 
  ad.publication_year AS 'Publication Year', 
  pi.item_type AS 'Paper Type', 
  ad.hyperlink AS 'Link' 
FROM 
  article_data AS ad 
  INNER JOIN publication_item AS pi ON pi.item_id = ad.item_id 
WHERE 
  pi.item_type = 'Book';

/* When user clicks the link and go to any of the Journal paper page, they can get more details 
about the particular journal paper including – Title of journal paper, abstract, year of publication,
 volume, issue and page numbers. Different journal paper have different article id, When id is changed,
 another journal article can be accessed (Dummy article id for journal added are 2,8, and 10). The query
 for this is given below */
SELECT 
  ad.article_id, 
  ad.title AS 'Title', 
  ad.abstract AS 'Abstract', 
  ad.publication_year AS 'Publication Year', 
  pi.item_type AS 'Paper Type', 
  journal.journal_title AS 'JOURNAL', 
  jp.volume_number as 'Volume', 
  jp.issue_number as 'Issue', 
  jp.page_number as 'Page' 
FROM 
  article_data AS ad 
  INNER JOIN publication_item AS pi ON pi.item_id = ad.item_id 
  INNER JOIN journal_paper as jp ON ad.article_id = jp.article_id 
  INNER JOIN journal ON journal.journal_id = jp.journal_id 
WHERE 
  pi.item_type = 'Journal Paper' 
  AND ad.article_id = 2;
  
/* If the user clicks a link to conference proceedings from dashboard, they will get more details
 about that paper including – Title of conference paper, place of publication, publisher, year of 
 publication and page number. The query for that is given below. */
SELECT 
  ad.article_id, 
  ad.title AS 'Title', 
  ad.abstract AS 'Abstract', 
  ad.publication_year AS 'Publication Year', 
  pi.item_type AS 'Paper Type', 
  conference.conference_title as 'Conference', 
  publisher.publisher_name as 'Publisher', 
  publisher.city as 'Place of Publication', 
  cp.page_number as 'Page Number' 
FROM 
  article_data AS ad 
  INNER JOIN publication_item AS pi ON pi.item_id = ad.item_id 
  INNER JOIN conference_paper as cp ON ad.article_id = cp.article_id 
  INNER JOIN conference ON conference.conference_id = cp.conference_id 
  INNER JOIN conference_paper_publisher as cpp ON cp.conference_paper_id = cpp.conference_paper_id 
  INNER JOIN publisher ON publisher.publisher_id = cpp.publisher_id 
WHERE 
  pi.item_type = 'Conference paper';
  
/*If the user clicks a link to any of the book, they can see title of the book, series title 
and series number (if exists), edition, place of publication, publisher and year of publication.
 The script is given below. */
SELECT 
  ad.article_id, 
  ad.title AS 'Title', 
  ad.abstract AS 'Abstract', 
  ad.publication_year AS 'Publication Year', 
  pi.item_type AS 'Paper Type', 
  book.edition as 'Edition', 
  si.series_title as 'Series Title', 
  si.series_number as 'Series Number', 
  publisher.publisher_name as 'Publisher Name', 
  publisher.city as 'Place of Publication' 
FROM 
  article_data AS ad 
  INNER JOIN publication_item AS pi ON pi.item_id = ad.item_id 
  INNER JOIN book ON ad.article_id = book.article_id 
  INNER JOIN book_publisher AS bp ON book.book_id = bp.book_id 
  INNER JOIN publisher ON publisher.publisher_id = bp.publisher_id 
  LEFT JOIN series_info AS si ON book.book_id = si.book_id 
WHERE 
  pi.item_type = 'Book';
  
/* When user clicks on a thesis paper link, they can see thesis specific datas like title of thesis, type of thesis,
 academic institution, and year of publication. These data can be queried using following SQL code. */
SELECT 
  ad.article_id, 
  ad.title AS 'Title', 
  ad.abstract AS 'Abstract', 
  ad.publication_year AS 'Publication Year', 
  pi.item_type AS 'Paper Type', 
  thesis.thesis_type as 'Thesis Type', 
  ai.inst_name as 'Academic Institution' 
FROM 
  article_data AS ad 
  INNER JOIN publication_item AS pi ON pi.item_id = ad.item_id 
  INNER JOIN thesis ON ad.article_id = thesis.article_id 
  INNER JOIN thesis_academic_institution AS tai ON thesis.thesis_id = tai.thesis_id 
  INNER JOIN academic_institution as ai ON ai.academic_inst_id = tai.academic_inst_id 
WHERE 
  pi.item_type = 'Thesis paper';
  
/* To fetch authors of an article */
SELECT 
  author_editor.fname AS firstName, 
  author_editor.lname AS lastName 
FROM 
  article_data 
  INNER JOIN article_author ON article_data.article_id = article_author.article_id 
  INNER JOIN author_editor ON author_editor.author_editor_id = article_author.author_editor_id 
WHERE 
  article_data.article_id = 3;
  
/*To fetch Editors of an article: */
SELECT 
  author_editor.fname AS firstName, 
  author_editor.lname AS lastName 
FROM 
  article_data 
  INNER JOIN article_editor ON article_data.article_id = article_editor.article_id 
  INNER JOIN author_editor ON author_editor.author_editor_id = article_editor.author_editor_id 
WHERE 
  article_data.article_id = 3;
  
/* To fetch Reviews, reviewer and review score of an article */
SELECT 
  review.review_comment as 'Comment', 
  review.review_score as 'Review Score', 
  profile.fname as 'First Name', 
  profile.lname as 'Last Name' 
FROM 
  article_data 
  INNER JOIN review ON article_data.article_id = review.article_id 
  INNER JOIN profile on profile.user_id = review.user_id 
WHERE 
  article_data.article_id = 9;
  
/* To fetch Reference details of article - reference title, reference link of an article */
SELECT 
  reference_details.reference_title AS 'Ref Title', 
  reference_details.reference_link AS 'Ref Link' 
FROM 
  article_data 
  INNER JOIN article_reference ON article_data.article_id = article_reference.article_id 
  INNER JOIN reference_details ON reference_details.reference_id = article_reference.reference_id 
WHERE 
  article_data.article_id = 1;

 /*Fetch paper's data based on user's subject of interest.  With this query, 
 all the paper written on subject big data is fetched from database. */
SELECT 
  ad.title, 
  ad.abstract, 
  article_keyword_table.keyword_term, 
  ad.hyperlink 
FROM 
  article_data AS ad 
  INNER JOIN (
    SELECT 
      ak.article_id, 
      kw.keyword_term 
    FROM 
      article_keyword AS ak 
      INNER JOIN keyword AS kw ON kw.keyword_id = ak.keyword_id
  ) AS article_keyword_table ON article_keyword_table.article_id = ad.article_id 
WHERE 
  keyword_term = "big data";
  
/* To fetch user's subjects of interest mentioned in their profile
 When a user is logged into the system, his dashboard will have paper recommendation
 based on his subjects of interest which he chose in his user profile. This can be achieved 
 by following query.
Fetching subject of interest of user with id 12:
 Here the user has subject interest of ‘java web’ and ‘software architecture’. 
 Result varies depending on the user logged into the system. */
SELECT 
  user_info.username,
  keyword.keyword_term, 
  user_keyword_interest.user_id 
FROM 
  keyword 
  INNER JOIN user_keyword_interest ON keyword.keyword_id = user_keyword_interest.keyword_id 
  INNER JOIN user_info ON user_info.user_id = user_keyword_interest.user_id 
WHERE 
  user_keyword_interest.user_id = 12;
  
/* Above mentioned user’s paper recommendation based on their subject of interest can be 
  fetched by following query. */
SELECT 
  article_data.title, 
  article_data.abstract, 
  kw.keyword_term, 
  article_data.hyperlink as 'Link' 
from 
  article_data 
  INNER JOIN article_keyword ON article_data.article_id = article_keyword.article_id 
  INNER JOIN (
    SELECT 
      keyword.keyword_id, 
      keyword.keyword_term 
    FROM 
      KEYWORD 
      INNER JOIN (
        SELECT 
          keyword_id 
        FROM 
          user_keyword_interest 
        WHERE 
          user_id = 12
      ) AS user_keyword ON keyword.keyword_id = user_keyword.keyword_id
  ) AS kw ON article_keyword.keyword_id = kw.keyword_id;
  
/* Recommendation based on co-author.
 Recommendation for authors, based on their co-authors is achieved with following query. 
 Steps followed achieving this result are
1.  Identifying the user id of Author
2.  Filter out the publications done by the author
3.  Find the co-authors involved in those publications
4.  Find the papers written by co-authors
 */
SELECT 
  author_editor.fname, 
  author_editor.lname, 
  article_data.title, 
  article_data.abstract, 
  article_data.hyperlink 
FROM 
  (
    SELECT 
      article_author.author_editor_id 
    FROM 
      (
        SELECT 
          article_author.article_id, 
          article_data.abstract, 
          article_data.hyperlink, 
          user_author.fname, 
          user_author.lname, 
          user_author.user_id, 
          user_author.author_editor_id 
        FROM 
          (
            SELECT 
              user_info.user_id, 
              author_editor.author_editor_id, 
              author_editor.fname, 
              author_editor.lname 
            FROM 
              profile 
              INNER JOIN user_info ON user_info.user_id = profile.user_id 
              INNER JOIN author_editor ON profile.email = author_editor.email
          ) AS user_author 
          INNER JOIN article_author ON article_author.author_editor_id = user_author.author_editor_id 
          INNER JOIN article_data ON article_data.article_id = article_author.article_id 
        WHERE 
          user_author.user_id = 13
      ) AS user_own_papers 
      INNER JOIN article_author ON user_own_papers.article_id = article_author.article_id
  ) AS final_result_table 
  INNER JOIN article_author ON final_result_table.author_editor_id = article_author.author_editor_id 
  INNER JOIN article_data ON article_data.article_id = article_author.article_id 
  INNER JOIN author_editor ON author_editor.author_editor_id = article_author.author_editor_id 
GROUP BY 
  title;
  
/* Reference links and title with their publication type.
 One of the requirements is to make database in such a way that it should be 
 able to reflect the type of references. Query for fetching type of references is given below
 */
SELECT 
  reference_details.reference_title, 
  publication_item.item_type as 'Type of Reference', 
  reference_details.reference_link 
FROM 
  reference_details 
  INNER JOIN publication_item ON publication_item.item_id = reference_details.item_id;
  
/* Recommendation based on links user visited. Recommendation of papers is done based on 
the papers read by the user. If a user reads a paper, then the papers coming under the subject/keywords
 of that read paper will be in user’s recommendation. This is accomplished by populating the 
 visited article id and user id into a table in database and using the query below. 
 Depending on the user_id the recommendation will change for each user. 
 */
SELECT 
  article_data.title, 
  article_data.abstract, 
  article_data.hyperlink, 
  uvp_keywords.keyword_term 
FROM 
  (
    SELECT 
      article_keyword.keyword_id, 
      keyword.keyword_term 
    From 
      (
        SELECT 
          user_library.article_id 
        FROM 
          user_library 
        WHERE 
          user_id = 11
      ) AS user_visited_papers 
      INNER JOIN article_keyword ON user_visited_papers.article_id = article_keyword.article_id 
      INNER JOIN keyword ON keyword.keyword_id = article_keyword.keyword_id
  ) AS uvp_keywords 
  INNER JOIN article_keyword ON uvp_keywords.keyword_id = article_keyword.keyword_id 
  INNER JOIN article_data ON article_data.article_id = article_keyword.article_id 
GROUP BY 
  title;

/* ALL RECOMMENDED PAPERS FOR A USER WHEN LOGGED IN TO THE SYSTEM */
-- BASED ON KEYWORD
(
  SELECT 
    article_data.article_id, 
    article_data.title, 
    article_data.abstract, 
    article_data.hyperlink as 'Link' 
  from 
    article_data 
    INNER JOIN article_keyword ON article_data.article_id = article_keyword.article_id 
    INNER JOIN (
      SELECT 
        keyword.keyword_id, 
        keyword.keyword_term 
      FROM 
        KEYWORD 
        INNER JOIN (
          SELECT 
            keyword_id 
          FROM 
            user_keyword_interest 
          WHERE 
            user_id = 13
        ) AS user_keyword ON keyword.keyword_id = user_keyword.keyword_id
    ) AS kw ON article_keyword.keyword_id = kw.keyword_id
) 
UNION 
  -- BASED ON CO AUTHOR
  (
    SELECT 
      article_data.article_id, 
      article_data.title, 
      article_data.abstract, 
      article_data.hyperlink 
    FROM 
      (
        SELECT 
          article_author.author_editor_id 
        FROM 
          (
            SELECT 
              article_author.article_id, 
              article_data.abstract, 
              article_data.hyperlink, 
              user_author.fname, 
              user_author.lname, 
              user_author.user_id, 
              user_author.author_editor_id 
            FROM 
              (
                SELECT 
                  user_info.user_id, 
                  author_editor.author_editor_id, 
                  author_editor.fname, 
                  author_editor.lname 
                FROM 
                  profile 
                  INNER JOIN user_info ON user_info.user_id = profile.user_id 
                  INNER JOIN author_editor ON profile.email = author_editor.email
              ) AS user_author 
              INNER JOIN article_author ON article_author.author_editor_id = user_author.author_editor_id 
              INNER JOIN article_data ON article_data.article_id = article_author.article_id 
            WHERE 
              user_author.user_id = 13
          ) AS user_own_papers 
          INNER JOIN article_author ON user_own_papers.article_id = article_author.article_id
      ) AS final_result_table 
      INNER JOIN article_author ON final_result_table.author_editor_id = article_author.author_editor_id 
      INNER JOIN article_data ON article_data.article_id = article_author.article_id 
      INNER JOIN author_editor ON author_editor.author_editor_id = article_author.author_editor_id 
    GROUP BY 
      title
  ) 
UNION 
  -- BASED ON USER VISITED/READ PAPERS
SELECT 
  article_data.article_id, 
  article_data.title, 
  article_data.abstract, 
  article_data.hyperlink 
FROM 
  (
    SELECT 
      article_keyword.keyword_id, 
      keyword.keyword_term 
    From 
      (
        SELECT 
          user_library.article_id 
        FROM 
          user_library 
        WHERE 
          user_id = 13
      ) AS user_visited_papers 
      INNER JOIN article_keyword ON user_visited_papers.article_id = article_keyword.article_id 
      INNER JOIN keyword ON keyword.keyword_id = article_keyword.keyword_id
  ) AS uvp_keywords 
  INNER JOIN article_keyword ON uvp_keywords.keyword_id = article_keyword.keyword_id 
  INNER JOIN article_data ON article_data.article_id = article_keyword.article_id 
GROUP BY 
  title;
  
/* One of the requirements is that, every author should have subjectwise contribution score 
based on their paper quality. This is calculated based on the review score they got for their 
published papers. An example of query to find this is given below. */
SELECT 
  author_editor.fname, 
  author_editor.lname, 
  keyword.keyword_term, 
  avg(review.review_score) AS 'Average contribution score' 
FROM 
  article_data 
  INNER JOIN article_author ON article_author.article_id = article_data.article_id 
  INNER JOIN author_editor ON author_editor.author_editor_id = article_author.author_editor_id 
  INNER JOIN review ON article_data.article_id = review.article_id 
  INNER JOIN profile ON review.user_id = profile.user_id 
  INNER JOIN article_keyword ON article_data.article_id = article_keyword.article_id 
  INNER JOIN keyword ON article_keyword.keyword_id = keyword.keyword_id 
WHERE 
  author_editor.author_editor_id = 1 
  AND keyword.keyword_id = 6;
  
/* ALGORITHM FOR RECOMMENDATION RANKING */
/* Finding the threshold score for the papers in system and assigning it to a variable.*/
SET 
  @threshold_score = (
    SELECT 
      avg(review.review_score) 
    from 
      article_data 
      INNER JOIN review ON article_data.article_id = review.article_id
  );
  
  select @threshold_score as 'THRESHOLD_SCORE';  /* score is found to be 6.166 */
  
/* item we want to recommend is assumed as article_id 5 */
SELECT 
  article_data.article_id, 
  article_data.title, 
  review.review_score, 
  review.user_id 
from 
  article_data 
  INNER JOIN review ON article_data.article_id = review.article_id 
WHERE 
  article_data.article_id = 5;
  
/* item we want to recommend is article_id 5, finding user_score of article_id 5 */
SELECT 
  avg(review.review_score) as USER_SCORE 
from 
  article_data 
  INNER JOIN review ON article_data.article_id = review.article_id 
WHERE 
  article_data.article_id = 5;   /* answer is found to be 7 */

/* Here USER_SCORE of article id 5 is found to be 7. which is more than the threshold, which is 6.166.
   Therefore, we should multiply this score by a 'w1'. 'w1' is assumed to be 10 in this case. */
SET 
  @first_score = (
    SELECT 
      avg(review.review_score) as USER_SCORE 
    from 
      article_data 
      INNER JOIN review ON article_data.article_id = review.article_id 
    WHERE 
      article_data.article_id = 5
  );
  
/* multiplying the score with w1 (w1 is assumed to be 10) and storing it in a variable */
Select 
  @first_score * 10 AS 'First Step Score';   /* answer is found to be 70 */

/* saving first step result in a variable called 'first_step_result'  */
SET 
  @first_step_result = (
    Select 
      @first_score * 10 AS First_Score
  );
Select @first_step_result;  /* answer is found to be 70 */

/* Step 2:
if item is associated with subjects of interest of user, calculations to be done
Let's take user with user_id 10 and article with article_id 5 for example calculation.
We should first check whether the article id 5 belongs to subject interest of user_id 10.
Finding subject interest of user with id = 10 */
SELECT 
  keyword.keyword_id, 
  keyword.keyword_term 
from 
  user_keyword_interest 
  INNER JOIN keyword ON keyword.keyword_id = user_keyword_interest.keyword_id 
WHERE 
  user_keyword_interest.user_id = 10;
-- result shows user interests are : software architecure and Ethical hacking

/* Now we should find whether the item belongs to which subject
   finding subjects of the article with id 5 */
SELECT 
  keyword.keyword_id, 
  keyword.keyword_term 
FROM 
  keyword 
  INNER JOIN article_keyword ON keyword.keyword_id = article_keyword.keyword_id 
WHERE 
  article_keyword.article_id = 5;
  
/* We can check if both user's subject interest and item's subject matches using the below query.
If they matches, then the inner join will give result equal to which subject it is matched. */
SELECT 
  user_sub_interest.keyword_id, 
  user_sub_interest.keyword_term 
FROM 
  (
    SELECT 
      keyword.keyword_id, 
      keyword.keyword_term 
    from 
      user_keyword_interest 
      INNER JOIN keyword ON keyword.keyword_id = user_keyword_interest.keyword_id 
    WHERE 
      user_keyword_interest.user_id = 10
  ) AS user_sub_interest 
  INNER JOIN (
    SELECT 
      keyword.keyword_id, 
      keyword.keyword_term 
    FROM 
      keyword 
      INNER JOIN article_keyword ON keyword.keyword_id = article_keyword.keyword_id 
    WHERE 
      article_keyword.article_id = 5
  ) AS article_sub ON user_sub_interest.keyword_id = article_sub.keyword_id;
  
/* Now the item matches the interest of the user, so we should calculate the sum of all 
subject specific scores of the item and multiply it with w2. 
Fetching subject specific scores of the item (here our subject is 'Ethical Hacking') */
SELECT 
  total_keywords.user_id, 
  total_keywords.keyword_term, 
  total_keywords.review_score 
FROM 
  (
    SELECT 
      keyword.keyword_id, 
      review.review_score, 
      review.user_id, 
      keyword.keyword_term 
    FROM 
      review 
      INNER JOIN article_keyword ON review.article_id = article_keyword.article_id 
      INNER JOIN keyword ON keyword.keyword_id = article_keyword.keyword_id 
    where 
      review.article_id = 5
  ) AS total_keywords 
  INNER JOIN (
    SELECT 
      keyword.keyword_id, 
      keyword.keyword_term 
    from 
      user_keyword_interest 
      INNER JOIN keyword ON keyword.keyword_id = user_keyword_interest.keyword_id 
    WHERE 
      user_keyword_interest.user_id = 10
  ) AS user_interest ON total_keywords.keyword_id = user_interest.keyword_id;
  
/* Calculating sum of al subject specific scores of the item */
SET 
  @subject_specific_sum = (
    SELECT 
      sum(total_keywords.review_score) as 'Total Sum' 
    FROM 
      (
        SELECT 
          keyword.keyword_id, 
          review.review_score, 
          keyword.keyword_term 
        FROM 
          review 
          INNER JOIN article_keyword ON review.article_id = article_keyword.article_id 
          INNER JOIN keyword ON keyword.keyword_id = article_keyword.keyword_id 
        where 
          review.article_id = 5
      ) AS total_keywords 
      INNER JOIN (
        SELECT 
          keyword.keyword_id, 
          keyword.keyword_term 
        from 
          user_keyword_interest 
          INNER JOIN keyword ON keyword.keyword_id = user_keyword_interest.keyword_id 
        WHERE 
          user_keyword_interest.user_id = 10
      ) AS user_interest ON total_keywords.keyword_id = user_interest.keyword_id
  );
  
/* multiplying the sum result with w2 (here w2 is assumed to be 20) and asssigning to a variable */
SELECT 
  @subject_specific_sum * 20 AS 'Second Step Result'; /* answer is found to be 420 */
  
  /* assigning the result value to a variable */
SET 
  @Second_step_Result = (
    SELECT 
      @subject_specific_sum * 20 AS 'Second Step Result'
  );
-- Adding second step result to the previous result
SET @result = @first_Step_result + @second_step_result;
SELECT @result; /* result is found to be 490 */

/* Third Step -
  We should count the user's co authors in the item's authorlist and multiply with w3.
	Finding user's co-authors */
SELECT 
  profile.user_id, 
  article_author.article_id 
FROM 
  article_author 
  INNER JOIN author_editor ON author_editor.author_editor_id = article_author.author_editor_id 
  INNER JOIN profile ON profile.email = author_editor.email 
where 
  article_author.article_id = 5 
  AND profile.user_id != 10;
  
/* counting the number of co-authors and storing the value to variable */
SELECT 
  count(profile.user_id) 
FROM 
  article_author 
  INNER JOIN author_editor ON author_editor.author_editor_id = article_author.author_editor_id 
  INNER JOIN profile ON profile.email = author_editor.email 
where 
  article_author.article_id = 5 
  AND profile.user_id != 10;
  
 /* assigning the result value to a variable*/ 
SET 
  @count_of_coauthors = (
    SELECT 
      count(profile.user_id) 
    FROM 
      article_author 
      INNER JOIN author_editor ON author_editor.author_editor_id = article_author.author_editor_id 
      INNER JOIN profile ON profile.email = author_editor.email 
    where 
      article_author.article_id = 5 
      AND profile.user_id != 10
  );
  
/* multiplying the result with w3 (w3 is assumed to be 30 here) */
SELECT 
  @count_of_coauthors; /*answer expected is 1 */

/* assigning result of third step to a variable */
SET 
  @third_step_result = (
    SELECT 
      @count_of_coauthors * 30
  );
-- Adding the third step result to the total result
SET @result = @result + @third_step_result;
SELECT @result;   /* result expected is 520 */

/*Fourth Step -
Find all author's subject specific scores and sum it up, then multiply the result with w4, and add 
to final result.
Finding all other author's subjects of interest */
SELECT 
  co_authors.user_id, 
  co_authors.article_id, 
  article_keyword.keyword_id, 
  keyword.keyword_term 
FROM 
  (
    SELECT 
      profile.user_id, 
      author_editor.author_editor_id, 
      article_author.article_id 
    FROM 
      article_author 
      INNER JOIN author_editor ON author_editor.author_editor_id = article_author.author_editor_id 
      INNER JOIN profile ON profile.email = author_editor.email 
    where 
      article_author.article_id = 5 
      AND profile.user_id != 10
  ) AS co_authors 
  INNER JOIN article_keyword ON co_authors.article_id = article_keyword.article_id 
  INNER JOIN keyword ON keyword.keyword_id = article_keyword.keyword_id;
  
/* finding subject specific scores of the item */
SELECT 
  co_authors.user_id, 
  co_authors.article_id, 
  article_keyword.keyword_id, 
  keyword.keyword_term, 
  review.review_score, 
  review.user_id 
FROM 
  (
    SELECT 
      profile.user_id, 
      author_editor.author_editor_id, 
      article_author.article_id 
    FROM 
      article_author 
      INNER JOIN author_editor ON author_editor.author_editor_id = article_author.author_editor_id 
      INNER JOIN profile ON profile.email = author_editor.email 
    where 
      article_author.article_id = 5 
      AND profile.user_id != 10
  ) AS co_authors 
  INNER JOIN article_keyword ON co_authors.article_id = article_keyword.article_id 
  INNER JOIN keyword ON keyword.keyword_id = article_keyword.keyword_id 
  INNER JOIN review on review.article_id = co_authors.article_id 
  INNER JOIN (
    SELECT 
      keyword.keyword_id, 
      keyword.keyword_term 
    from 
      user_keyword_interest 
      INNER JOIN keyword ON keyword.keyword_id = user_keyword_interest.keyword_id 
    WHERE 
      user_keyword_interest.user_id = 10
  ) as article_subject ON article_subject.keyword_id = article_keyword.keyword_id;
  
/* SUM of subject specific scores  */
SELECT 
  sum(review.review_score) SUB_SPECIFIC_SCORE 
FROM 
  (
    SELECT 
      profile.user_id, 
      author_editor.author_editor_id, 
      article_author.article_id 
    FROM 
      article_author 
      INNER JOIN author_editor ON author_editor.author_editor_id = article_author.author_editor_id 
      INNER JOIN profile ON profile.email = author_editor.email 
    where 
      article_author.article_id = 5 
      AND profile.user_id != 10
  ) AS co_authors 
  INNER JOIN article_keyword ON co_authors.article_id = article_keyword.article_id 
  INNER JOIN keyword ON keyword.keyword_id = article_keyword.keyword_id 
  INNER JOIN review on review.article_id = co_authors.article_id 
  INNER JOIN (
    SELECT 
      keyword.keyword_id, 
      keyword.keyword_term 
    from 
      user_keyword_interest 
      INNER JOIN keyword ON keyword.keyword_id = user_keyword_interest.keyword_id 
    WHERE 
      user_keyword_interest.user_id = 10
  ) as article_subject ON article_subject.keyword_id = article_keyword.keyword_id;
  
/* Storing the score obtained in fourth step in a variable and multiplying 
by w4 (W4 is assumed to be 40) */
SET 
  @coauthor_sub_specific_score = (
    SELECT 
      sum(review.review_score) SUB_SPECIFIC_SCORE 
    FROM 
      (
        SELECT 
          profile.user_id, 
          author_editor.author_editor_id, 
          article_author.article_id 
        FROM 
          article_author 
          INNER JOIN author_editor ON author_editor.author_editor_id = article_author.author_editor_id 
          INNER JOIN profile ON profile.email = author_editor.email 
        where 
          article_author.article_id = 5 
          AND profile.user_id != 10
      ) AS co_authors 
      INNER JOIN article_keyword ON co_authors.article_id = article_keyword.article_id 
      INNER JOIN keyword ON keyword.keyword_id = article_keyword.keyword_id 
      INNER JOIN review on review.article_id = co_authors.article_id 
      INNER JOIN (
        SELECT 
          keyword.keyword_id, 
          keyword.keyword_term 
        from 
          user_keyword_interest 
          INNER JOIN keyword ON keyword.keyword_id = user_keyword_interest.keyword_id 
        WHERE 
          user_keyword_interest.user_id = 10
      ) as article_subject ON article_subject.keyword_id = article_keyword.keyword_id
  );
  
  /* saving the fourth step result in a variable*/
SET 
  @fourth_step_result = (
    SELECT 
      @coauthor_sub_specific_score * 40
  );
  /* updating total result */
SET 
  @result = @result + @fourth_step_result;
SELECT @result; /* answer is expected to be 1360 */

/* Fifth step - 
In this step, we need to find all items user has read, and then
 count the number of items that share atleast one author with 
 the item we want to recommend
 Finding all items the user has already read */
SELECT 
  article_data.article_id, 
  user_library.user_id, 
  article_data.title 
FROM 
  user_library 
  INNER JOIN article_data ON article_data.article_id = user_library.article_id 
WHERE 
  user_id = 10;
  
/* Finding the articles that share atleast one author with the item we want to recommend */
SELECT 
  visited_articles.article_id, 
  article_author.author_editor_id 
FROM 
  (
    SELECT 
      article_data.article_id, 
      article_data.title 
    FROM 
      user_library 
      INNER JOIN article_data ON article_data.article_id = user_library.article_id 
    WHERE 
      user_id = 10
  ) AS visited_articles 
  INNER JOIN article_author on visited_articles.article_id = article_author.article_id 
  INNER JOIN (
    SELECT 
      profile.user_id, 
      article_author.article_id, 
      author_editor.author_editor_id 
    FROM 
      article_author 
      INNER JOIN author_editor ON author_editor.author_editor_id = article_author.author_editor_id 
      INNER JOIN profile ON profile.email = author_editor.email 
    where 
      article_author.article_id = 5 
      AND profile.user_id != 10
  ) AS coauthors on coauthors.author_editor_id = article_author.author_editor_id;
  
/* count of items shared by atleast one author */
SELECT 
  count(visited_articles.article_id) as 'Article Count' 
FROM 
  (
    SELECT 
      article_data.article_id, 
      article_data.title 
    FROM 
      user_library 
      INNER JOIN article_data ON article_data.article_id = user_library.article_id 
    WHERE 
      user_id = 10
  ) AS visited_articles 
  INNER JOIN article_author on visited_articles.article_id = article_author.article_id 
  INNER JOIN (
    SELECT 
      profile.user_id, 
      article_author.article_id, 
      author_editor.author_editor_id 
    FROM 
      article_author 
      INNER JOIN author_editor ON author_editor.author_editor_id = article_author.author_editor_id 
      INNER JOIN profile ON profile.email = author_editor.email 
    where 
      article_author.article_id = 5 
      AND profile.user_id != 10
  ) AS coauthors on coauthors.author_editor_id = article_author.author_editor_id;
SET 
  @shared_item_count = (
    SELECT 
      count(visited_articles.article_id) as 'Article Count' 
    FROM 
      (
        SELECT 
          article_data.article_id, 
          article_data.title 
        FROM 
          user_library 
          INNER JOIN article_data ON article_data.article_id = user_library.article_id 
        WHERE 
          user_id = 10
      ) AS visited_articles 
      INNER JOIN article_author on visited_articles.article_id = article_author.article_id 
      INNER JOIN (
        SELECT 
          profile.user_id, 
          article_author.article_id, 
          author_editor.author_editor_id 
        FROM 
          article_author 
          INNER JOIN author_editor ON author_editor.author_editor_id = article_author.author_editor_id 
          INNER JOIN profile ON profile.email = author_editor.email 
        where 
          article_author.article_id = 5 
          AND profile.user_id != 10
      ) AS coauthors on coauthors.author_editor_id = article_author.author_editor_id
  );
  
/* MULTIPLYING the result by w5 (w5 is aussmed as 50) */
SELECT @shared_item_count; /* expected value is 2 */
/* saving the fifth_step result in a variable */
SET 
  @fifth_step_result = (
    SELECT 
      @shared_item_count * 50
  );
  
SELECT @fifth_step_result;

/* updating the result */
SET 
  @result = @result + @fifth_step_result;
SELECT @result; /* expected value is 1460 */

/* finding matching subject/keyword of user read articles to the item to recommend */
SELECT 
  item_keyword.keyword_id 
FROM 
  (
    SELECT 
      article_keyword.keyword_id, 
      user_read_articles.article_id 
    FROM 
      (
        SELECT 
          article_data.article_id, 
          article_data.title 
        FROM 
          user_library 
          INNER JOIN article_data ON article_data.article_id = user_library.article_id 
        WHERE 
          user_id = 10
      ) AS user_read_articles 
      INNER JOIN article_keyword ON user_read_articles.article_id = article_keyword.article_id
  ) AS user_read_keyword 
  INNER JOIN (
    SELECT 
      keyword.keyword_id, 
      keyword.keyword_term 
    FROM 
      keyword 
      INNER JOIN article_keyword ON keyword.keyword_id = article_keyword.keyword_id 
    WHERE 
      article_keyword.article_id = 5
  ) AS item_keyword ON item_keyword.keyword_id = user_read_keyword.keyword_id;
  
/* count of matching subjects  */
SELECT 
  count(item_keyword.keyword_id) as 'matching_sub_count' 
FROM 
  (
    SELECT 
      article_keyword.keyword_id, 
      user_read_articles.article_id 
    FROM 
      (
        SELECT 
          article_data.article_id, 
          article_data.title 
        FROM 
          user_library 
          INNER JOIN article_data ON article_data.article_id = user_library.article_id 
        WHERE 
          user_id = 10
      ) AS user_read_articles 
      INNER JOIN article_keyword ON user_read_articles.article_id = article_keyword.article_id
  ) AS user_read_keyword 
  INNER JOIN (
    SELECT 
      keyword.keyword_id, 
      keyword.keyword_term 
    FROM 
      keyword 
      INNER JOIN article_keyword ON keyword.keyword_id = article_keyword.keyword_id 
    WHERE 
      article_keyword.article_id = 5
  ) AS item_keyword ON item_keyword.keyword_id = user_read_keyword.keyword_id;
  
  /* saving the count in a variable */
SET 
  @matching_keyword_count = (
    SELECT 
      count(item_keyword.keyword_id) as 'matching_sub_count' 
    FROM 
      (
        SELECT 
          article_keyword.keyword_id, 
          user_read_articles.article_id 
        FROM 
          (
            SELECT 
              article_data.article_id, 
              article_data.title 
            FROM 
              user_library 
              INNER JOIN article_data ON article_data.article_id = user_library.article_id 
            WHERE 
              user_id = 10
          ) AS user_read_articles 
          INNER JOIN article_keyword ON user_read_articles.article_id = article_keyword.article_id
      ) AS user_read_keyword 
      INNER JOIN (
        SELECT 
          keyword.keyword_id, 
          keyword.keyword_term 
        FROM 
          keyword 
          INNER JOIN article_keyword ON keyword.keyword_id = article_keyword.keyword_id 
        WHERE 
          article_keyword.article_id = 5
      ) AS item_keyword ON item_keyword.keyword_id = user_read_keyword.keyword_id
  );
  
/* Multiplying with w6 (w6 is assumed as 60) */
SELECT 
  @matching_keyword_count;
/* saving sixth step result in a variable */
SET 
  @sixth_step_result = (
    SELECT 
      @matching_keyword_count * 60
  );

/* updating result */
SET 
  @result = @result + @sixth_step_result;
SELECT @result; /* final score is 1580 */

