/* inserting value to publication type table */
INSERT INTO publication_item 
VALUES 
  (1, 'Journal Paper'), 
  (2, 'Conference Paper'), 
  (3, 'Thesis Paper'), 
  (4, 'Book');
  
/* inserting value to article_data table */
INSERT INTO article_data 
values 
  (
    1, 2, 'Strongly budget balanced auctions for multi-sided markets', 
    'In two-sided markets, Myerson and Satterthwaite''s impossibility theorem states that one can not maximize the gain-from-trade while also satisfying truthfulness, individual-rationality and no deficit. Attempts have been made to circumvent Myerson and Satterthwaite''s result by attaining approximately-maximum gain-from-trade: the double-sided auctions of McAfee (1992) is truthful and has no deficit, and the one by Segal-Halevi et al.(2016) additionally has no surplus—it is strongly-budget-balanced.', 
    2020, 'https://doi.org/10.1609/aaai.v34i02.5571'
  ), 
  (
    2, 1, 'Big Data in the Public Sector: Lessons for Practitioners and Scholars', 
    'In this essay, we consider the role of Big Data in the public sector. Motivating our work is the recognition that Big Data is still in its infancy and many important questions regarding the true value of Big Data remain unanswered. The question we consider is as follows: What are the limits, or potential, of Big Data in the public sector? By reviewing the literature and summarizing insights from a series of interviews from public sector Chief Information Officers (CIOs), we offer a scholarly foundation for both practitioners and researchers interested in understanding Big Data in the public sector.', 
    2014, 'https://doi.org/10.1177/0095399714555751'
  ), 
  (
    3, 4, 'Java Web Services Architecture', 
    'In this essay, Written by industry thought leaders, Java Web Services Architecture is a no-nonsense guide to web services technologies including SOAP, WSDL, UDDI and the JAX APIs. This book is useful for systems architects and provides many of the practical considerations for implementing web services including authorization, encryption, transactions and the future of Web Services.', 
    2003, 'https://www.oreilly.com/library/view/java-web-services/9781558609006/'
  ), 
  (
    4, 3, 'The role of galectins in differentiation of acute myeloid leukemia cells', 
    DEFAULT, 
    2022, 'https://ir.lib.uwo.ca/etd/8409'
  ), 
  (
    5, 2, 'A Conf paper on ethical hacking', 
    'paper written by sameer tyagi and benoy jacob. Edited by kate crowford', 
    2022, 'https://doi.org/10.1609/aaai.v34i02.2312312'
  ), 
  (
    6, 4, 'A book on social media management', 
    'book written by dana boyd. Edited by corina derman and James Mcgovern', 
    2017, 'https://book.google.com/socialmediamanagement'
  ), 
  (
    7, 3, 'A Thesis paper on database management', 
    'thesis written by jolaine smith and rica gonen', 
    2019, 'https://thesis.com/databasemangemnt'
  ), 
  (
    8, 1, 'A journal paper on artificial intelligence', 
    'journal paper written by lothlorein and rica gonen', 
    2015, 'https://ieee.com/artificialt'
  ), 
  (
    9, 4, 'A book on public management', 
    'book written by jolaine smith, edited by sunil mathew', 
    2016, 'https://archive.com/management'
  ), 
  (
    10, 1, 'A journal paper on galectin', 
    'book written by donald trump', 
    2010, 'https://galectin.com/galc'
  ), 
  (
    11, 2, 'A conf paper on web design', 
    'book written by sunil mathew, edited by lothlorein', 
    2010, 'https://ethcas.com/webdev'
  ), 
  (
    12, 3, 'A thesis paper on cyber security', 
    'book written by james mcg, edited by donald trump', 
    2010, 'https://secuitcyber.com/ceyber'
  );
  
/* inserting value into academic institution table */
INSERT INTO academic_institution 
VALUES 
  (
    1, 'University of Western Ontario', 
    '1151 Richmond St', 'London', 'ON N6A 3K7'
  ), 
  (
    2, 'University of Birmingam', 'birmingham city', 
    'Birmingham', 'B17 5DT'
  ), 
  (
    3, 'Aston street', 'Aston', 'Birmingham', 
    'B56as'
  );
  
/* inserting value into academic institution table */
INSERT INTO author_editor 
VALUES 
  (
    1, 'Jolaine', 'Smith', 'jolaine@mail.com'
  ), 
  (
    2, 'James', 'McGovern', 'McGovern@mail.com'
  ), 
  (
    3, 'Danah', 'Boyd', 'Boyd@mail.com'
  ), 
  (
    4, 'Kate', 'Crawford', 'Crawford@mail.com'
  ), 
  (
    5, 'Sameer', 'Tyagi', 'Tyagi@mail.com'
  ), 
  (
    6, 'Michael', 'Stevens', 'Stevens@mail.com'
  ), 
  (
    7, 'Sunil', 'Mathew', 'Mathew@mail.com'
  ), 
  (
    8, 'Lothlorien', 'Homet', 'Homet@mail.com'
  ), 
  (
    9, 'Corina', 'Derman', 'Derman@mail.com'
  ), 
  (
    10, 'Rica', 'Gonen', 'Gonen@mail.com'
  ), 
  (
    11, 'Erel', 'Segal-Halevi', 'Halevi@mail.com'
  ), 
  (
    12, 'Kevin', 'Desouza', 'desouza@mail.com'
  ), 
  (
    13, 'Benoy', 'Jacob', 'bjacob@mail.com'
  ), 
  (
    14, 'Donald', 'Trump', 'trump@mail.com'
  );
  
/* inserting book info to book table */
INSERT INTO book 
VALUES 
  (1, 3, 'first'), 
  (2, 6, 'third'), 
  (3, 9, 'second');
  
/* inserting series details to series_info table */
INSERT INTO series_info 
VALUES 
  (
    1, 1, 'The Morgan Kaufmann Series in Data Management Systems', 
    15
  ), 
  (
    2, 2, 'The Dana Boyd Series in Social Media Management', 
    3
  );
  
/* inserting publisher information to publisher table */
INSERT INTO publisher 
VALUES 
  (
    1, 'AAAI Press', 'Palo Alto', 'California', 
    'NY 94301'
  ), 
  (
    2, 'Morgan Kaufmann', 'Pine Street', 
    'Massachusetts', 'CA 94104'
  ), 
  (
    3, 'Alchemist Publishers', 'San andreas', 
    'Arizona', 'AR 435'
  ), 
  (
    4, 'JK publishers', 'London Street', 
    'London', 'L2 B64'
  );
  
/* inserting author information to article */
INSERT INTO article_author 
VALUES 
  (1, 10), 
  (1, 11), 
  (2, 12), 
  (2, 13), 
  (3, 2), 
  (3, 5), 
  (3, 6), 
  (3, 7), 
  (4, 1), 
  (5, 5), 
  (5, 13), 
  (6, 3), 
  (7, 1), 
  (7, 10), 
  (8, 8), 
  (8, 10), 
  (9, 1), 
  (10, 14), 
  (11, 7), 
  (12, 2);
  
/* inserting keyword or subjects to the database */
INSERT INTO keyword 
VALUES 
  (1, 'Galectins'), 
  (2, 'Artificial intelligence'), 
  (3, 'Acute myeloid leukemia'), 
  (4, 'big data'), 
  (5, 'Java web'), 
  (6, 'public management'), 
  (7, 'software architecture'), 
  (8, 'policy analysis'), 
  (9, 'Cyber security'), 
  (10, 'Ethical hacking'), 
  (11, 'Web designing'), 
  (12, 'social media'), 
  (13, 'Security');
  
/* inserting data to create connection between keyword/subjects and articles */
INSERT INTO article_keyword 
VALUES 
  (1, 2), 
  (2, 4), 
  (2, 6), 
  (2, 8), 
  (3, 5), 
  (3, 7), 
  (4, 1), 
  (4, 3), 
  (5, 10), 
  (6, 5), 
  (6, 6), 
  (6, 12), 
  (7, 4), 
  (7, 11), 
  (8, 2), 
  (8, 4), 
  (8, 7), 
  (9, 6), 
  (10, 1), 
  (10, 3), 
  (11, 5), 
  (11, 11), 
  (12, 9), 
  (5, 13);
  
/* inserting thesis information to thesis table */
INSERT INTO thesis 
VALUES 
  (1, 4, 'PhD'), 
  (2, 7, 'Msc'), 
  (3, 12, 'Bsc');
  
/* inserting user information to user table */
INSERT INTO user_info 
VALUES 
  (1, 'ajohn11', 'john123', 'Reader'), 
  (
    2, 'pjwilliams', 'william123', 'Author'
  ), 
  (3, 'kraman', 'Ram123', 'Both'), 
  (
    4, 'arfouzan', 'fouzan123', 'Author'
  ), 
  (
    5, 'nguyen', 'nguyen123', 'Reader'
  ), 
  (
    6, 'Jolainesm', 'jolain!32', 'Both'
  ), 
  (7, 'jamesmc', 'james123', 'Both'), 
  (8, 'danaboyd', 'danab132', 'Both'), 
  (
    9, 'katecrow', 'crowa!312', 'Both'
  ), 
  (
    10, 'jmsameer', 'sameen!32', 'Both'
  ), 
  (
    11, 'mchael', 'micheal!32', 'Both'
  ), 
  (
    12, 'sunmath', 'suneil!122', 'Both'
  ), 
  (13, 'lothhome', 'homet!a', 'Both'), 
  (
    14, 'corderman', 'corde!3as', 'Both'
  ), 
  (15, 'ricgo12', 'rickas2', 'Both'), 
  (
    16, 'erelseg', 'erelseg092', 'Both'
  ), 
  (
    17, 'kevdesou1', 'keve1212', 'Both'
  ), 
  (
    18, 'benoyjac', 'benoy2122', 'Both'
  ), 
  (
    19, 'trump12', 'trump2114122', 'Both'
  );
  
/* inserting values to user's profile table  */
INSERT INTO `profile` 
VALUES 
  (
    1, 'Alan', 'John', '07898707643', 'alanjohn@mail.com', 
    'Phone'
  ), 
  (
    2, 'Pelij', 'William', '0312707643', 
    'pjwilliam@mail.com', 'Email'
  ), 
  (
    3, 'Kim', 'Raman', '057545643', 'kimrama@mail.com', 
    'Phone'
  ), 
  (
    4, 'Arkam', 'Fouzan', '91-987865452', 
    'arfouz@mail.com', 'Email'
  ), 
  (
    5, 'Nguyen', 'ng', '2526346', 'nguyen@mail.com', 
    'Phone'
  ), 
  (
    6, 'Jolaine', 'Smith', '7884643', 'jolaine@mail.com', 
    'Phone'
  ), 
  (
    7, 'James', 'McGovern', '76534532', 
    'McGovern@mail.com', 'Email'
  ), 
  (
    8, 'Danah', 'Boyd', '126436323', 'Boyd@mail.com', 
    'Email'
  ), 
  (
    9, 'Kate', 'Crawford', '65574352', 
    'Crawford@mail.com', 'Phone'
  ), 
  (
    10, 'Sameer', 'Tyagi', '3242345', 'Tyagi@mail.com', 
    'Email'
  ), 
  (
    11, 'Michael', 'Stevens', '325234', 
    'Stevens@mail.com', 'Email'
  ), 
  (
    12, 'Sunil', 'Mathew', '23423441', 
    'Mathew@mail.com', 'Phone'
  ), 
  (
    13, 'Lothlorien', 'Homet', '5636433', 
    'Homet@mail.com', 'Email'
  ), 
  (
    14, 'Corina', 'Derman', '2112322', 
    'Derman@mail.com', 'Phone'
  ), 
  (
    15, 'Rica', 'Gonen', '122312335', 'Gonen@mail.com', 
    'Email'
  ), 
  (
    16, 'Erel', 'Segal-Halevi', '12131232', 
    'Halevi@mail.com', 'Phone'
  ), 
  (
    17, 'Kevin', 'Desouza', '12546433', 
    'desouza@mail.com', 'Email'
  ), 
  (
    18, 'Benoy', 'Jacob', '0411707643', 
    'bjacob@mail.com', 'Phone'
  ), 
  (
    19, 'Donald', 'Trump', '9897654325', 
    'trump@mail.com', 'Email'
  );
  
/* inserting data to journals table */
INSERT INTO journal  
VALUES 
  (1, 'SAGE journals'), 
  (2, 'IEE Journal'), 
  (3, 'PUBMED journal'), 
  (4, 'Aston Journal');
  
/* inserting all details about journal paper to journal_paper table */
INSERT INTO journal_paper 
VALUES 
  (1, 2, 1, '7', '49', '1043-1064'), 
  (2, 8, 3, '6', '23', '100-106'), 
  (3, 10, 2, '2', '5', '65-70');
  
/* inserting  conference details to conference table */
INSERT INTO conference 
VALUES 
  (
    1, 'AAAI Conference on Artificial Intelligence'
  ), 
  (
    2, 'International conference on ethical hacking'
  ), 
  (
    3, 'International conference on web development'
  );
  
/* inserting all details about conference paper to conference_paper table */
INSERT INTO conference_paper 
VALUES 
  (1, 1, 1, '130-135'), 
  (2, 3, 11, '10-15'), 
  (3, 2, 5, '27-29');
  
/* inserting publisher data to books in book_publisher table */
INSERT INTO book_publisher 
VALUES 
  (2, 1), 
  (3, 2), 
  (4, 3);
  
/* inserting publisher data to conference paper in conference_paper_publisher table */
INSERT INTO conference_paper_publisher 
VALUES 
  (1, 1), 
  (2, 3), 
  (3, 2);
  
/*  Inserting academic institution data to thesis information using thesis_academic_institution table */
INSERT INTO thesis_academic_institution 
VALUES 
  (1, 1), 
  (2, 3), 
  (3, 2);
  
/* adding information about editors to conference papers and books */
INSERT INTO article_editor 
VALUES 
  (1, 3), 
  (1, 5), 
  (3, 8), 
  (3, 9), 
  (6, 2), 
  (6, 9), 
  (9, 7), 
  (11, 8);
  
/* adding reference articles and links to the reference table */
INSERT INTO reference_details 
VALUES 
  (
    1, 4, 'Thinking in Java', 'https://www.abebooks.co.uk/9780131872486/Thinking-Java-Eckel-Bruce-0131872486/plp'
  ), 
  (
    2, 2, 'Adaptive Unimodal Cost Volume Filtering for Deep Stereo Matching', 
    'https://arxiv.org/abs/1909.03751'
  ), 
  (
    3, 4, 'Machine Learning Algorithms', 
    'https://books.google.co.uk/books/about/Machine_Learning_Algorithms.html?id=_-ZDDwAAQBAJ'
  ), 
  (
    4, 4, 'Principles of Database Management', 
    'https://www.google.co.uk/books/edition/Principles_of_Database_Management/aeRfDwAAQBAJ'
  ), 
  (
    5, 3, 'Detection and Repair of Architectural Inconsistencies in Java', 
    'https://ieeexplore.ieee.org/document/8812079'
  ), 
  (
    6, 1, 'From old public administration to new public management', 
    'https://www.tandfonline.com/doi/abs/10.1080/09540969409387823'
  ), 
  (
    7, 3, 'Analyzing Facebook User Risk using Machine Learning Algorithm', 
    'http://dspace.bracu.ac.bd/xmlui/handle/10361/14447'
  ), 
  (
    8, 3, 'Black-Box Parallelization for Machine Learning', 
    'https://d-nb.info/1200020057/34'
  ), 
  (
    9, 2, 'Suppressing external visual distractors from driver’s field of view', 
    'https://ieeexplore.ieee.org/document/8639951/'
  ), 
  (
    10, 2, 'Extracting State Machines from Feedforward Neural Networks', 
    'https://ieeexplore.ieee.org/document/8639897/'
  ), 
  (
    11, 1, 'Galectins: versatile modulators of cell adhesion, cell proliferation, and cell death', 
    'https://link.springer.com/article/10.1007/s001090050232'
  ), 
  (
    12, 1, 'Big Data and Management', 
    'https://journals.aom.org/doi/full/10.5465/amj.2014.4002'
  );
  
/* adding references to articles through article_reference table */
INSERT INTO article_reference 
VALUES 
  (1, 8), 
  (1, 3), 
  (1, 2), 
  (1, 7), 
  (2, 12), 
  (2, 3), 
  (3, 1), 
  (3, 5), 
  (3, 9), 
  (3, 8), 
  (4, 11), 
  (4, 12);
  
/* adding reviews and review scores to the review table */
INSERT INTO review 
VALUES 
  (
    1, 6, 1, 6, 'Excellent presentation'
  ), 
  (
    2, 17, 1, 8, 'Clear cut approach towards the topic'
  ), 
  (
    3, 14, 3, 4, 'Book is not to the point, could have improved'
  ), 
  (
    4, 5, 3, 4, 'I did not like the way of explanation in this article'
  ), 
  (
    5, 16, 5, 7, 'Article is good, still room for improvement'
  ), 
  (
    6, 9, 7, 10, 'loved the presentation and writing style'
  ), 
  (
    7, 11, 5, 5, 'I would say an average quality subject presentation'
  ), 
  (8, 4, 8, 7, 'good article'), 
  (9, 6, 9, 4, 'not so good article'), 
  (
    10, 14, 12, 7, 'to the point presentation, loved it'
  ), 
  (
    11, 7, 6, 8, 'Still room for improvement, overall it is informative'
  ), 
  (12, 18, 2, 6, 'very informative'), 
  (13, 4, 9, 7, 'good article'), 
  (
    14, 15, 9, 7, 'I like this article way of explanation'
  ), 
  (
    15, 1, 10, 3, 'This is very badly presented information'
  ), 
  (
    16, 2, 5, 9, 'amazing article, I think this is a path breaking idea'
  ), 
  (
    DEFAULT, 3, 9, 3, 'VERY POORLY WRITTEN'
  ), 
  (
    DEFAULT, 4, 3, 6, 'average article'
  );
  
/* inserting details of user visited links to the table */
INSERT INTO user_library 
VALUES 
  (6, 10), 
  (6, 12), 
  (6, 5), 
  (11, 4), 
  (17, 6), 
  (11, 9), 
  (14, 3), 
  (10, 5), 
  (10, 3), 
  (10, 6), 
  (10, 11), 
  (10, 2);
  
/* inserting details of users interested subjects/keywords to a table */
INSERT INTO user_keyword_interest 
VALUES 
  (13, 1), 
  (8, 18), 
  (13, 2), 
  (10, 1), 
  (7, 10), 
  (4, 11), 
  (11, 1), 
  (11, 4), 
  (11, 17), 
  (12, 5), 
  (12, 7), 
  (13, 11), 
  (7, 11), 
  (5, 12), 
  (7, 12), 
  (5, 13), 
  (7, 13), 
  (10, 13), 
  (10, 10);
