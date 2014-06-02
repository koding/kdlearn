---
title: phpMyAdmin on Koding
importance: 5
template: page.toffee
---

# phpMyAdmin on Koding

phpMyAdmin is isntalled by default on your VM. To access it, visit:

```
http://<username>.kd.io/phpmyadmin
```

Where `<username>` is your Koding username.

To login to phpmyadmin you will need to set a MySQL password manually. This can 
be done with the following command into your [Koding 
Terminal](https://koding.com/Terminal):

```
mysqladmin -u root password NEWPASSWORD
```

Now when you visit phpmyadmin, login with the following credentials:

- User:   **root**
- Pass:   **NEWPASSWORD**

Replace **NEWPASSWORD** with your MySQL Password of choice.

## Troubleshooting

### MySQL 2002 Error

Please see the [this article](/faq/mysql-socket-error-2002/).
