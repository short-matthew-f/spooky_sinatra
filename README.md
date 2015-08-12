# Our First CSS Framework, powered by JSON

We're going to practice the following things:

- Reading and parsing data from a `JSON` file
- Rendering that data as `html` with `erb`
- Incorporating a CSS framework into our `erb`
- Using `sinatra` to serve up the rendered `html`

## Let's start by creating the data

In your `/data` folder you will see a `seed.rb` file.  Here are some notable facts about it:

- It requires both the `faker` gem, and the `json` library\
- You should already have `json`, but might not currently have `faker` installed
- To install `faker`, from your console type `gem install faker`
- If you're using `rbenv` (you probably are), follow this up with `rbenv rehash`
- It uses `faker` to create fake data for our app
- It will create a `users.json` file, populated with a bunch of fake users

### OK, do this!

From the `/data` directory, run `ruby seed.rb`, and you'll get a `users.json` file.  Congrats, data exists!

## Now, let's get it up on a page

1. Create a route for a `get` request to `/users`.  In it you should read the content of the `data/users.json` file and store it in a local variable.  Have the final part of that route be a call to `erb` to render `:index`

2. Then, create the `index.erb` file in your `views` folder.  Make sure it has `html` tags, as well as a `head` and `body` tag.

3. In it, we'll have to iterate over the `@users` object to create components for each `user`.

4. Get the user data up and running, any way you can.

5. **REMEMBER** that addresses are also an array, and you will have to iterate over them.  Put the addresses in a `table`.

## Now, let's restructure it using a CSS framework

To the top of your `index.erb`, inside the `head` tag, add a link to the SkeletonCSS *CDN*  You can copy below:

```html
<link rel='stylesheet' type='text/css' href='https://cdnjs.cloudflare.com/ajax/libs/skeleton/2.0.4/skeleton.min.css'>
```

### The Grid

Skeleton is really really lightweight.  Like, insanely lightweight.  It has very few opinions, one of which is about the grid.

#### `container`

The grid starts with a container:

```html
<div class='container'>
  <!-- stuff -->
</div>
```

Skeleton's container is `960px` wide, fully centered, and full of joy.  Why `960`?   Let's look at the numbers which divide evenly into 960:

```
1, 2, 3, 4, 5, 6, 8, 10, 12, 15, 16, 20, 24, 30, 32, 40, 48, 60, 64, 80, 96, 120, 160, 192, 240, 320, 480, 960
```

There's a silly number of divisors, the most important of which is 12.  Each divisor can represent an even number of columns you might want to use in a layout.  Each one can divide your width into nice equal chunks.  Usually, grid-based systems divide into twelfths.

#### `row`

Inside the container is a row:

```html
<div class='container'>

  <div class='row'>
    <!-- stuff -->
  </div>

</div>
```

The row is another type of container.  It's full width, so it is 960px (thanks to the container's width), and it allows components inside of it to be broken into columns.  

The thing to remember is that ROWS *contain* COLUMNS, not the other way around.

#### `columns`

Then, inside your row are columns.

```html
<div class='container'>
  <div class='row'>

    <div class='three columns'>
      <!-- narrow stuff -->
    </div>

    <div class='nine columns'>
      <!-- wide stuff -->
    </div>

  </div>
</div>
```

The key here is that the columns need to add up to 12.  

## Upgrade your layout

Design a `user` `div`, with the intention of having three per row.

You can use anything that Skeleton has to offer.  For example, [tables](http://getskeleton.com/#tables)!  

This will give you a small sense of pride, as your layouts will look much cleaner.

```html
<div class="user four columns">
  <!-- stuff goes here -->
</div>
```
