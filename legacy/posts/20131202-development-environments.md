title: Development Environments
link: http://learn.koding.com/development-environments/
author: lee
description: 
post_id: 428
created: 2013/12/02 22:38:25
created_gmt: 2013/12/02 22:38:25
comment_status: closed
post_name: development-environments
status: publish
post_type: post

# Development Environments

If we go back to our [Develop](add_new_domain.png) section, we see a little button there labeled **Show Environments**.

If we click it, this fancy menu opens up which displays your Machines and Domains. Each domain can point to a machine, allowing you to direct traffic from from a domain to your machine. Lets create a new domain, and point it to our machine!

First, click the Plus icon above your Domains

![add_new_domain](/wp-content/uploads/add_new_domain.png)

  


From there, type in a domain name and then choose **Add Domain**:

![choose_subdomain_name](/wp-content/uploads/choose_subdomain_name.png)

  


Now we have a new domain on Koding, but we probably want to point it to a machine right? To do this, click and drag on the domain, and drag it over to the VM of your choice. A confirmation window will pop up, choose yes.

![confirmation_domain](/wp-content/uploads/confirmation_domain.png)

  


After the confirmation, your Domain will point to your VM, as seen below. You can confirm this by visiting the address right now.

![assigned_domain](/wp-content/uploads/assigned_domain.png)

  


But what if we want to run something outside of Apache, such as a custom Nodejs project? We'll cover that [Next!](/terminal-and-custom-ports/)