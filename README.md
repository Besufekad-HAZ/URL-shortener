# URL-shortener
URL shortener is a web application that takes a long URL and generates a shorter, unique URL that redirects to the original URL. This is useful for sharing long links, especially on platforms with character limits like social media.

## Requirements

* Submit a url in a form on the homepage
* URL is saved to database
* The URL can be viewed by accessing a Base62 encoded primary key ID (short code ) of the URL at /v/:id
* A user should be a able to copy the short URL to the Clipboard
* When visiting the short code, a view is recorded so we can keep track of how many views per day a link gets.
* A total number of views should be saved to the url record
* A user should be able to view a graph of views over the past 2 weeks
* A user should be able to edit and delete a URL
* We should alst retrieve the title, decription, and opengraph image for the html document
    * This should run in the background to keep the application fast
    * If a URL is editted, we should update the title,description, and image for it
* We should paginate the list of shortened URLs

