---
author: Team Koding
date: 2014-08-04
categories: [koding]
collection: guide

series: contribute
series-index: 1
template: series.toffee
---

# Overview and Guidelines

When submitting guides to Koding University you must understand the 
document structure, as well as writing styles. Guides on Koding 
University should be formatted in a similar style and tone. This guide 
will outline some guideliness for guide submissions to adhere to.

Note that while these should be taken as *best practices* more than 
absolute law, submissions may be rejected if they deviate too far from 
the guidelines.


## What is Koding University?

Koding University is an Open Source, statically generated site.  Each 
document is stored as Markdown files found in the [KDLearn 
Repository][repo]. The actual implementation code is hidden in the 
dotfile directory named `.metalsmith`. We'll go over this directory in 
the [Previewing][previewing] guide.

## File Structure

By keeping the content in the main directory, and hiding the 
implementation, the file structure becomes **content first**. Meaning 
that at the root of the repo you see the actual content structure. You do 
not need to know how to compile the site, or any real implementation 
details, just write markdown!

As an example, lets look at the markdown file that you're reading now.  
If you look at the [repo][repo], you'll see a file named 
[contribute.md][contributeonrepo]. This file compiles to 
<http://learn.koding.com/contribute/guidelines/index.html>. Notice how 
the `contribute` name is at the root of both projects?

- `./contribute/index.md` becomes
  `http://learn.koding.com/contribute/index.html`
- `./guides/markdown.md` becomes
  `http://learn.koding.com/guides/markdown/index.html`
- `./faq/one-more-step.md` becomes
  `http://learn.koding.com/faq/one-more-step/index.html`
- `./guides/your-new-guide.md` becomes
  `http://learn.koding.com/guides/your-new-guide/index.html`

See the pattern? Each file can be accessed from the same name on the 
website, minus the `.md`. `./foo.md` becomes `/foo` on the website.

That means if you add a file, either markdown **or** image, it will be 
added to the site with the same location relative to the project root.  
It's not hidden away in some obscure and complicated file structure, what 
you see in markdown is what shows up on the site. Content first.


## Recommended URL Structure

Now that you understand the File Structure and how it correlates to the 
generated URL, we recommend that you adhere to the following naming 
conventions for your document URLs.

0. Guides should be within the `kdlearn/guides` directory.
1. Your filename should describe your guide in clear wording.
2. Be concise. Try not to have more than 5 words for a filename.
3. No special characters. Plain words and hyphens only. Example: 
`foo-bar-baz.md`.

## Title and Description

A guide's title and description are also very important to the document.  
These will be how people *find* your guide.

The title is your Markdown Header 1. It should be similar to the URL, 
concise, no more than 7 words.

The description is the first paragraph of your guide, directly following 
the Markdown Header *(title)*. Explain what the guide is about, and what 
the technologies being explained are. Keep it to a single paragraph.

## Headers are awesome, use them.

Headers are a great way to separate content sections. They stand out, can 
be linked to directly, and have levels built into them without nesting 
indentation.

These are preferred over ordered lists for larger sections. Ordered lists 
are great for small steps, headers are great for larger steps / 
instructions.

Don't forget, headers with levels *(`## Header1`, `### Header 3`, and so 
forth)* should be used to group content just like you do with HTML's 
`<h2>`s and so forth. You can review Header Markdown [here][headers]



[previewing]: previewing
[repo]:              https://github.com/koding/kdlearn
[contributeonrepo]:  https://github.com/koding/kdlearn/blob/master/contribute/guidelines.md
[headers]: /guides/markdown/#headers
