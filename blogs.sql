1. Write a query to find all the blog posts whose created date is greater/equal to given date.	
SELECT 
  * 
FROM 
  blogs_details 
WHERE
  bd_date_added >= '2016-06-14 11:21:43';

2. Write a query to find all the blog posts whose create date is less than given date.	
SELECT
  * 
FROM 
  blogs_details 
WHERE 
  bd_date_added < '2016-06-14 11:21:43';
  
3. Write a query to find all the blog posts whose created date between given start date & end date.	
SELECT 
  * 
FROM 
  blogs_details 
WHERE 
  bd_date_added between '2016-06-12 11:21:43' 
  AND '2016-06-15 11:21:43';
  
4. Write a query to list all the comments on a particular blog.	 
SELECT 
  bc_comment
FROM 
  blogs_comments 
WHERE 
  bc_blog_id = 2;
  
5. Write a query to transfer all the posts of a particular user to another user.	
UPDATE 
  blogs_details 
SET 
  bd_user_id = 2 
WHERE 
  bd_user_id = 1;

6. Write a query to get total published blogs
SELECT 
  COUNT(*) 
FROM 
  blogs_details 
WHERE 
  bd_blog_status = 'PUBLISHED';

7. Write a query to update blog title of "8 SEO strategies to keep on radar in 2017" to "8 SEO strategies to keep on radar in 2018"	
UPDATE
    blogs_details
SET
    bd_blog_title = '8 SEO strategies to keep on radar in 2018'
WHERE
    bd_blog_title = '8 SEO strategies to keep on radar in 2017';
	
8. Write a query to get all active users	
SELECT
    *
FROM
    blogs_users
WHERE
    bu_status = 'Active';

9. Write a query to get all active categories	
SELECT
    *
FROM
    blogs_categories
WHERE
    bc_category_status = 'ACTIVE';
	
10. Write a query to find all the blog posts for a particular user (i.e. based on username)	
SELECT
    d.*
FROM
    blogs_users AS u
INNER JOIN blogs_details AS d
ON
    u.bu_user_id = d.bd_user_id
WHERE
    u.bu_first_name = 'Arjun';
	
11. Write a query to find the user details for a particular post	
SELECT
    u.*
FROM
    blogs_users AS u
INNER JOIN blogs_details AS d
ON
    u.bu_user_id = d.bd_user_id
WHERE
    d.bd_blog_id = 3;
	
12. Write a query to delete all the posts of a particular user	
DELETE
FROM
    blogs_details
WHERE
    bd_user_id = 1;
	
13. Write a query to find blog post & their corresponding comment count.	
SELECT
    d.bd_blog_title,
    COUNT(c.bc_comment_id)
FROM
    blogs_details d
INNER JOIN blogs_comments c ON
    d.bd_blog_id = c.bc_blog_id
GROUP BY
    d.bd_blog_title;
	
14. Write two query to get all published blogs modified by inactive users	
SELECT
    bd_blog_title
FROM
    blogs_details AS d
INNER JOIN blogs_users AS u
ON
    d.bd_modified_by = u.bu_user_id
WHERE
    d.bd_blog_status = 'Published' AND u.bu_status = 'Inactive';
	
15. Write a query to get most modifed blogs according to all users	
SELECT
    bd_modified_by
FROM
    blogs_details
GROUP BY
    bd_modified_by
ORDER BY
    COUNT(bd_modified_by)
DESC
LIMIT 1;

16. Write a query to get draft blogs by inactive users	
SELECT
    d.*
FROM
    blogs_details AS d
INNER JOIN blogs_users AS u
ON
    d.bd_user_id = u.bu_user_id
WHERE
    d.bd_blog_status = 'draft' AND u.bu_status = 'Inactive';
	
17. Write a query to find the blog post having the maximum comment count.	
SELECT
    bc_blog_id,
    COUNT(bc_comment_id)
FROM
    blogs_comments
GROUP BY
    bc_blog_id
ORDER BY
    COUNT(bc_comment_id)
DESC
LIMIT 1;

18.Write a query to get all active categories and their no of blogs	
SELECT
    c.bc_category_name,
    COUNT(bd_blog_id)
FROM
    blogs_details AS d
INNER JOIN blogs_categories AS c
ON
    c.bc_category_id = d.bd_category_id
WHERE
    c.bc_category_status = 'Active'
GROUP BY
    bd_category_id;
	
19. Write a query to find out all the blog post of particular given sub category (Sub category name is given)	
SELECT
    d.bd_blog_title
FROM
    blogs_details d
INNER JOIN blogs_categories c ON
    d.bd_category_id = c.bc_category_id
WHERE
    c.bc_category_name = 'Linux Application';
	
20. Write a query to find out all the blog post of particular given main category (category name is given)	
SELECT
    d.bd_blog_title
FROM
    blogs_details d
INNER JOIN blogs_categories c ON
    d.bd_category_id = c.bc_category_id
WHERE
    c.bc_category_name = 'hardware';
