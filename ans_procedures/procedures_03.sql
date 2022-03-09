/*
The following routines in this section do not have return values, 
and should be implemented as PostgreSQL procedures 
(https://www.postgresql.org/docs/14/sql-createprocedure.html).
*/

/*
(3) reply( 
    user_id INTEGER, 
    other_comment_id INTEGER, 
    content TEXT, 
    reply_timestamp TIMESTAMP )

 Creates a reply from user on another comment
*/
CREATE OR REPLACE PROCEDURE reply( 
    user_id INTEGER, 
    other_comment_id INTEGER, 
    content TEXT, 
    reply_timestamp TIMESTAMP )
AS $$ 

$$LANGUAGE SQL;
