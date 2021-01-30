1

-----

Balloonicorn's Cupcake shop is getting ready to send a marketing
email announcing a new promotion on Funfetti cupcakes. We need to get all of
our customers' email addresses to Marketing.
 
Select all of the email addresses from the Customers table in alphabetical order.

The result set should be:
        email        
---------------------
 aperson@hotmail.com
 bpersonne@yahoo.com
 jdoe@gmail.com



-----


SELECT email
FROM customers
ORDER BY email;


==========
2

-----

Jane Doe has requested receipts for all of her past cupcake orders.
To look up the receipts, we need to know which orders Jane placed.
 
Write a query that lists the order ids for all orders placed by customers with
the first name Jane and last name Doe. Use a SUBQUERY to do this, not a join.

The result set should be:
 id 
----
  1
  3
  4
  6
  8
(5 rows)


-----


SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE fname = 'Jane' AND lname = 'Doe')
;


==========
3

-----

Balloonicorn needs to schedule her employees for the next week
based on how many cupcakes have been ordered and not yet processed.
 
Write a query that gets the total number of cupcakes from unprocessed orders.

The result set should be:
 sum 
-----
 209
 (1 row)
 

-----


SELECT SUM(num_cupcakes) FROM orders WHERE processed = 'FALSE';


==========
4

-----

Balloonicorn is working on her inventory and wants to know how many
cupcakes have been ordered of each type.
 
Write a query that shows the name of each cupcake and the sum of cupcakes
ordered for that cupcake type (for both processed and unprocessed orders),
sorted in ascending alphabetical order of cupcake name.

The report should show all cupcake types, even if they have not been ordered
at all.

The result set should be:
    name     | sum 
-------------+-----
 carrot cake |  10
 chocolate   |    
 funfetti    |  13
 raspberry   |  25
 red velvet  | 215
 vanilla     | 202
(6 rows)


-----


SELECT c.name, SUM(o.num_cupcakes) AS sum FROM cupcakes AS c LEFT JOIN orders AS o ON (c.id = o.cupcake_id) GROUP BY name ORDER BY name;