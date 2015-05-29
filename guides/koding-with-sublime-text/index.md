---
author: koding
description: 'Koding with Sublime Text'
categories: [common questions, Sublime Text]
---

# Koding with Sublime Text

This guide will show you how to connect your Koding VM with Sublime Text (v2 or v3) via SFTP.

## What you will need:
- [Set up FTP](http://learn.koding.com/guides/setting-up-ftp-on-koding) on your Koding VM 
- Your Koding username
- Your Koding VM user's password
- Your [VM Hostname](http://learn.koding.com/faq/vm-hostname/)
- [Sublime Text](https://www.sublimetext.com/) v2.x or v3.x

## Getting started
1. Download [Package Control](https://sublime.wbond.net/installation#st2) and use the `Package Control: Install Package` command from the command palette. The command palette is opened via `ctrl+shift+p` on Windows and Linux, and `cmd+shift+p` on OS X.
![alt tag](st1.png)

2. Once you run the Package Control: Install Package command, a list of packages will appear. Type in `SFTP` and hit enter. Using Package Control ensures Sublime SFTP will stay up to date automatically.
![alt tag](st2.png)

3. Open the folder that you want to sync with your VM using Sublime Text
![alt tag](st4.png)

4. Right click the folder in the sidebar and select `SFTP/FTP` -> `Map to Remote`
![alt tag](st5.png)

5. You should now see a file by the name of `sftp-config.json` open up in the editor
![alt tag](st6.png)

6. Configure your `sftp-config.json` file as described below and save it.
```
{
    // The tab key will cycle through the settings when first created
    // Visit http://wbond.net/sublime_packages/sftp/settings for help
    
    // sftp, ftp or ftps <<<< this is very important. only use 'ftp'
    "type": "ftp",
    
    // select the options below that suit your needs
    "save_before_upload": true,
    "upload_on_save": false,
    "sync_down_on_open": false,
    "sync_skip_deletes": false,
    "sync_same_age": true,
    "confirm_downloads": false,
    "confirm_sync": true,
    "confirm_overwrite_newer": false,
    
    // vm connection config
    // make sure that your personal domain is active. see http://learn.koding.com/faq/vm-hostname/
    "host": "<your koding username>.koding.io",
    "user": "<your koding username>",
    // this is not your koding password
    "password": "<your vm user's password>",
    //"port": "22",
    
    "remote_path": "/home/<your koding username>",
    "ignore_regexes": [
        "\\.sublime-(project|workspace)", "sftp-config(-alt\\d?)?\\.json",
        "sftp-settings\\.json", "/venv/", "\\.svn/", "\\.hg/", "\\.git/",
        "\\.bzr", "_darcs", "CVS", "\\.DS_Store", "Thumbs\\.db", "desktop\\.ini"
    ],
    //"file_permissions": "664",
    //"dir_permissions": "775",
    
    //"extra_list_connections": 0,

    "connect_timeout": 30,
    "keepalive": 120,
    "ftp_passive_mode": true,
    //"ftp_obey_passive_host": false,
    //"ssh_key_file": "~/.ssh/id_rsa",
    //"sftp_flags": ["-F", "/path/to/ssh_config"],
    
    //"preserve_modification_times": false,
    //"remote_time_offset_in_hours": 0,
    //"remote_encoding": "utf-8",
    //"remote_locale": "C",
    //"allow_config_upload": false,
}
```

7. Right click the folder, select `SFTP/FTP`. You will now see many more options than before.
![alt tag](st9.png)

8. (**IMPORTANT**) Chose whether you want to `Sync Local -> Remote` or `Sync Remote -> Local`. Be very careful about which you choose. `Sync Local -> Remote` overwrites what you have in your remote directory that you specified in you `sftp-config.json` file with what you have in your local directory.  `Sync Remote -> Local` overwrites what you have in your local directory with what you have in your remote directory that you specified in you `sftp-config.json` file.
![alt tag](st10.png)

9. (**IMPORTANT**) Check what is about to be performed in the box below before confirming your actions!
![alt tag](st11.png)

And there you have it, a folder synced with your Koding VM.
