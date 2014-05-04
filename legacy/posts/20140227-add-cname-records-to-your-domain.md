title: Add CNAME records to your domain
link: http://learn.koding.com/add-cname-records-to-your-domain/
author: kdlearn
description: 
post_id: 522
created: 2014/02/27 08:01:32
created_gmt: 2014/02/27 08:01:32
comment_status: closed
post_name: add-cname-records-to-your-domain
status: publish
post_type: post

# Add CNAME records to your domain

## Video

## Guide

  Mapping your own domains to Koding is now possible, and very easy. In this article, we'll go over this simple process.  

  1. First, navigate to your **Environments** page, located here: <https://koding.com/Environments>
  2. Next, click on the **Domain Plus button**, highlighted in this image:![cname-01-domain-plus](/wp-content/uploads/cname-01-domain-plus-1024x565.png)
  3. Next, click on "**Route own domain**".
  4. If you want to create an **A RECORD**, copy the **IP** located in the yellow box, as seen in this image: ![cname-02-route](/wp-content/uploads/cname-02-route-1024x619.png)
  5. Next, navigate to your **Domain Registrar**. In this demo, we're using Name.com, but any domain provider you choose will work with Koding, as long as they support custom **CNAME / A Records**.
  6. Once at your registrar, create a **CNAME**, or **A Record**, for your domain.
  7. If you want a **A Record**, set the Record value to the IP you copied from the yellow box on Koding.
  8. If you want a **CNAME** Record, type kd.io in the Record value. As an example, the following image shows a filled out **CNAME** record: ![cname-03-namedotcom](/wp-content/uploads/cname-03-namedotcom-1024x400.png)
  9. Now save your Record on your domain, and on Koding, click the **Create** button.
  10. After that, drag your Domain, onto your VM.
That's it! Now visit your domain, and you should see your Koding VM.