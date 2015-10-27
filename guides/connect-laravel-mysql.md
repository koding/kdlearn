#Connecting Laravel 5.1 to a MySQL Database

##Step 1: Create a MySQL Database and User

You need to create a MySQL database so that your Laravel application has something to connect to. In order to do this, make sure that you have both MySQL and PHPMyAdmin installed on your Koding VM. You can find the instructions on how to do this [here](http://learn.koding.com/guides/installing-mysql/) and [here](http://learn.koding.com/guides/install-phpmyadmin/). **Make sure that you can access the PHPMyAdmin panel before proceeding.**

Once you have accessed the PHPMyAdmin control panel, look at the panel on the right-hand side labeled "Database server." The first list item should say: 
- Server: Localhost via UNIX socket

These instructions are written for a database server running on `localhost`. If your database server is located elsewhere, be sure to update that location later on when we update Laravel's `.env` file. (All that being said, `localhost` is the Koding default, so you shouldn't have to change anything here.)

Once you've verified your database servers's location, we need to complete two more steps before we are ready to connect your Laravel application to MySQL. They are:
1. Create a database
2. Create a user for Laravel to use when it accesses the database
  
###Creating a Database in PHPMyAdmin

On the main PHPMyAdmin page, click the "Databases" button on the main top toolbar. On that screen, enter a name for your database and hit "Create."

###Creating a User in PHPMyAdmin

Now click on the "Users" button from the top main toolbar. Under the list of current users you will find a link labeled "Add User." Click that and enter a new username and password combination. For the `Host` field, use the dropdown menu and select `Local`.

**Make sure to remember the values you entered while creating your user and database. You will need them to tell Laravel where to look for the database as well as give it permission to access it.**

##Step Two: Connect Laravel to the MySQL Database

In this step you will need to edit the `.env` file included in your Laravel install. It should be located in the main directory by default - not within any subfolders. (Make sure that you have a `.env` file and not just a `.env.example` file. If you are missing the `.env` file, make a copy of the `.env.example` file and rename it as `.env`.)

The Laravel `.env` file contains a number of configurations that Laravel uses to run your app. The database connection configurations are part of that set.

In order to connect your Laravel app to MySQL, find the database section of the `.env` file (the fields will all have the prefix `DB`), enter the location of the database server (the Koding default for this should be `localhost`), the name of the database that you created, and the username and password associated with the user that your just created.
  
For example, if my database server is localhost, my user is named 'Jim' with a password of "LaravelRocks!", and my database is named "My_Laravel_Database", then the DB section of my .env file should look like this:

`DB_HOST=localhost`

`DB_DATABASE=My_Laravel_Database`

`DB_USERNAME=Jim`

`DB_PASSWORD=LaravelRocks!`
  
The settings in your .env file need to **exactly** match the server name, user information, and database name set up in PHPMyAdmin, otherwise your connection will fail.

Once you've entered that information, save the file, go to the command line, and  run `php artisan migrate`. You should see a message indicating that the "migration" was successful. (Laravel migrations are beyond the scope of this article, but you can learn more about them [here](http://laravel.com/docs/5.1/migrations) and [here](https://laracasts.com/series/laravel-5-fundamentals/episodes/7). For now, just know that a successful migration means that your Laravel app is successfully communicating with your MySQL database.)

To see the results of this connection in to your database, return to PHPMyAdmin. There should be two additional tables in the database that you created for your project.

If you see the new tables, congratulations, you've established a connection between your Laravel app and your MySQL database. If you don't see them, check the `database/migrations` folder in your Laravel install. There should be two files in that folder - one to create a users table and one to create a password resets table. If the files are there but you are still having trouble connecting to your database, review this guide and the [Laravel documentation](http://laravel.com/docs/5.1) to see where you might have made a mistake.
