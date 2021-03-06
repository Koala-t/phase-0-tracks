# http_requests

## Question 1:
## What are some common HTTP status codes?

* any code in the 200's indicates successful transfer of text
* any code in the 300's indicates a redirect
* codes in the 400's indicate an error on the client side
* codes in the 500's indicate an error on the server side
* 200 - everything is ok
* 403 - the user does not have access to the requested information
* 404 - the requested information was not found
* 500 - when an unidentified error occured on the server side
* 503 - the web server is currently unavailable
* 504 - it too too long for the request to be completed

## Question 2:
## What is the difference between a GET request and a POST request? When might each be used?

* A GET request will **request** data from a specific resource while a POST request will **submit** data to a specific resource.
* GET requests can be cached or bookmarked, and remain in the browser history while POST requests do not. 
* You can use a GET request to get an image to display on the client screen.
* You can use a POST request to send login information to the server.

## Question 3:
## What is a cookie (the technical kind, not the delicious kind)? How does it relate to HTTP requests?

* A cookie is a piece of information stored on the client's computer to preserve state. (i.e. Are they logged in? What is in their shopping cart?)
* authentication cookies track if the user is logged in or otherwise have access to sensitive information.
* tracking cookies keep track of the user's long-term browsing history. 
* session cookies are deleted when the user leaves the webpage.
* persistent cookies last a set amount of time, then are deleted.
* zombie cookies are automatically recreated after it is deleted.