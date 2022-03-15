-- the commented out if end if is to make a new version instead of new comment

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
DECLARE
    user_id_arg             INTEGER := user_id;
    other_comment_id_arg    INTEGER := other_comment_id;

    comment_id              INTEGER;
BEGIN


SELECT r.id into comment_id 
    FROM reply r left join comment c on r.id = c.id
    WHERE c.user_id = user_id_arg
        AND r.other_comment_id = other_comment_id_arg
;

-- if comment_id ISNULL
-- THEN
    -- create comment and reply
    -- ensure that serial id sequence is correct
    PERFORM setval('Comment_id_seq', max(id)) FROM Comment;

    insert into Comment VALUES (DEFAULT, user_id);
    SELECT CURRVAL('Comment_id_seq') into comment_id;
    insert into reply values (comment_id, other_comment_id_arg);
-- end if;

INSERT INTO reply_version VALUES
    (comment_id, reply_timestamp, content);
END;
$$LANGUAGE plpgsql;
