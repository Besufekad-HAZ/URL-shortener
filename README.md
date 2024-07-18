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

## Continuous Integration and Deployment

This project uses a Continuous Integration/Continuous Deployment (CI/CD) pipeline to automate testing and deployment. The pipeline is defined in the `.github/workflows/ci.yml` file and performs the following actions:

- **Automated Testing**: On every pull request to any branch and on every push to the `development` branch, the CI pipeline runs automated tests to ensure the application is functioning as expected. This includes running unit tests and integration tests to validate the behavior of the application.

- **Deployment**: Upon successful completion of tests in the `development` branch, the CI pipeline automatically deploys the application to Heroku. This ensures that the latest version of the application is always available and reduces the risk of human error in the deployment process.

### How It Works

1. **Trigger**: The pipeline is triggered by pull requests to any branch or pushes to the `development` branch.
2. **Test**: The pipeline sets up a testing environment with Ruby and PostgreSQL. It then executes the application's test suite to ensure all tests pass.
3. **Deploy**: If the push is to the `development` branch and all tests pass, the pipeline proceeds to deploy the application to Heroku, making the latest version available to users.

This CI/CD pipeline ensures that the URL Shortener application maintains a high standard of quality with every change and is always available to users in its most up-to-date form.

