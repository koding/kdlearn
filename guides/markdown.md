---
title: Markdown Basics, for Koding
author: Team Koding
date: 2014-05-30
categories: [markdown]

template: page.toffee
---

# Markdown Basics, for Koding

Markdown is a simple language whose syntax can be easily converted into HTML.  
Koding, like many other sites, use Markdown as a way for users to easily style 
their text. In this guide, we'll go over the basics of Markdown and it's usage.

## Official Documentation

The official [Markdown 
documentation](http://daringfireball.net/projects/markdown/syntax) covers the 
Markdown syntax quite well, and as such this guide will only briefly touch on 
each major syntax structure. If any questions remain, please refer to the 
official documentation.

## Emphasis

Emphasis can be achieved by wrapping the word you'd like to emphasise with a 
single asterisk or underline. Example:

```markdown
Hello, *this is emphasised* and this isn't!
```

## Strengthen

To strengthen your text wrap it with *double* asterisks or underlines. Example:

```markdown
Hello, **this is strong** and this isn't!
```

## Inline Code

Typing code within a sentence is considered *inline* code. Inline code is 
accomplished by wrapping the code with backticks `\` For example:

```markdown
Foo `bar` baz
```

## Code Blocks

Codeblocks can be achieved by wrapping your code in triple backticks, but make 
sure to include a newline after each tripple backtick. Example:

    Take a look at my awesome code:
    
    ```coffee
    do -> console.log 'Weee' while true
    ```
    
    Nifty eh?

Note the `coffee` text right behind the first triple backtick. This signifies 
the language of the code used in that code block, and Koding will add syntax 
highlighting if you specify the language.

## Headers

```markdown
# This is a Header 1

## This is a Header 2
```

The `# foo` syntax represents headers of varying levels. The number of hashes 
represents the level of header, with a maximum of 6.

## Links

```markdown
[Koding](https://koding.com)
[Koding Terminal, from Koding](/Terminal)
```

The `[foo](bar)` syntax will create a link. Links can be absolute or relative, 
just like html links.

## Unordered Lists

Unordered lists can be by prepending your items with a hyphen. Example:

```markdown
- Item one
- Item two
- Item three
```

Markdown will also embed lists and list content, if you add indentation.  
Example:

```markdown
- Item one
- Item two
  This is still within item two.
  - This is a list item in item two.
  - And another
- Item three
```

## Ordered Lists

Ordered lists are identical to unordered lists in features, you just have to 
prepend your list items with a number, instead of a hyphen. Example:

```markdown
1. Item one
2. Item two
3. Item three
```

## Images

You can easily include images in your markdown by using the following notation:

```markdown
![Alt text](full url to the image)
![Alt text](full url to the image "Optional title")
```

> type:success
> foo bar

***

> type:warning
> foo bar

***

> type:error
> foo bar

***

> type:tip
> foo bar