#
# # Linkback
#
# Change the linkback user interactions based on the users logged
# in/out status on Koding.
#


jQuery.ready ->
  username = jQuery.cookie 'ajs_user_id'
  # The cookie value is stored as `"foo"`, so we trim off the quotes
  # If it equals `"null"` we set it to null
  username = if username is '"null"' then null else username[1...-1]

  # If the username doesn't exist, we display a register message.
  if not username?
    link = jQuery '.koding-linkback .large a'
    link.text 'Register for a free Koding account and try this now'
    link.attr 'href', 'https://koding.com/Register?\
      utm_source=KodingUniversity&\
      utm_content=SignupButton&\
      utm_campaign=growth'
   # If the user does exist, they see the message set in html.
