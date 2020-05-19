# Dermstore Coding Challenge
### Background
This project uses Lumen, a lightweight framework. Based on Laravel. Also uses MySQL as the database and jQuery with bootstrap on the front end. It prevents SQL injection, sensitive data exposure, logs all login attempts, and attempts to prevent log in after 5 failed attempts for 5 hours. 
### Installation
To install:
* Clone repo
* Run `composer install`
* Use `dermstore_challenge.sql` to create the DB and Tables, along with some sample data. One example user is `edge2` with `test` as the password.
* In the source directory, create an .env file. Sample: 
```APP_NAME=Lumen
 APP_ENV=local
 APP_KEY=
 APP_DEBUG=true
 APP_URL=http://localhost
 APP_TIMEZONE=UTC
 
 LOG_CHANNEL=stack
 LOG_SLACK_WEBHOOK_URL=
 
 DB_CONNECTION=mysql
 DB_HOST=127.0.0.1
 DB_PORT=3306
 DB_DATABASE=DB_NAME
 DB_USERNAME=DB_USERNAME
 DB_PASSWORD=DB_PASSWORD
 
 CACHE_DRIVER=file
 QUEUE_CONNECTION=sync
```




## Thanks for applying to Dermstore

### Information

* Set aside around 2-3 hours to complete this challenge.
* Fork this repo and build your project in your forked repo.
* Target PHP 7.4, MySQL 8.0 and any framework. Or go framework-less.

### Challenge

* Create a customer login form that checks `username` and `password` inputs against values stored in a database.
* Bare-bones UI is fine.
* Bonus points for mitigating two (or more) of OWASP's [Top 10](https://owasp.org/www-project-top-ten/) vulnerabilities.
* Log all attempts whether successful or not.
* Include the CREATE TABLE statements in a separate file.

## #Tables

* customers
* login_activity
