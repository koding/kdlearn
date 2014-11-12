---
author: Federico Ponzi
username: federicoponzi
date: 2014-10-08
categories: [postgresql, codeigniter]
---

# Migration: Fix issues with PostgreSQL and Codeigniter

This guide will help you fix the issues with Codeigniter and PostgreSQL that you might have after migrating to the new Koding VM.

These are the steps that will help you debug your problems:

 1. Remember: the VM URL has changed. Update $config['base_url'] variabile inside the application/config/config.php file.
 2. Make sure that postgresql is installed: You can achieve this by using the following command in your Terminal:
    ```sudo apt-get install postgresql-9.3 ```
 3. Make sure that your database exists, and check the credentials inside application/config/database.php
 4. Make sure that php-postgre drivers are installed. Use the following commands to achieve this: 
    ```sudo apt-get install php5-pgsql```
    and then: 
	```sudo service apache2 restart```
 5. Inside application/config/database.php, Make sure that this line is set like this:
    ```$db['default']['db_debug'] = FALSE;```

And that should fix your PostgreSQL and Codeigniter issues upon migration.
