Connecting Laravel 5.1 to a MySQL Database

Make sure that you have mysql and phpmyadmin installed (see Koding guides for these here and here)
Log into PHPMyAdmin
Verify that your database server is localhost (this should be the default setting on Koding)
  (see pic)
  
Log into PHPMyAdmin and create:
  - a user
  - a database
    (point them to the guides on this?)

Make sure to remember these values.

You will need to edit your .env file (make sure that you have one of these and not just a .env.example file)
  (instructions for creating a .env - explanation of what it is)
  
So, if I'm working on Koding, my database server is localhost, my user is named 'John' with a password of "LaravelRocks!", and I've set up a blank database with the name "My_Laravel_Database", then the DB section of my .env file should look like this:

DB_HOST=localhost
DB_DATABASE=My_Laravel_Database
DB_USERNAME=John
DB_PASSWORD=LaravelRocks!
  
The settings in your .env file need to match the server name, user info, and database name set up in PHPMA.

Once that is done, run //php artisan migrate//, log in to your database in PHPMyAdmin, and you should see two new tables in the database you created.
If you do, congrats, you've established a connection.

Laravel migrations are beyond the scope of this guide, but they act like version control for your project. You can learn more about them at:
http://laravel.com/docs/5.1/migrations
and
https://laracasts.com/series/laravel-5-fundamentals/episodes/7
