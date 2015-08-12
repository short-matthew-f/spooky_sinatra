# Skeleton Homework

Included in this homework folder is another `seed.rb` file, which creates yet another `json` file.

1. Create a new sinatra application (in a new folder)
2. Make sure there's an `app.rb`, as well as a `Gemfile`, and a `config.ru`
3. Put the `seed.rb` in the `data` folder, and run it from within that folder.
4. Create an `index.erb` as well as a `show.erb`
5. The `index.erb` should iterate over the banks from the `json` data file, and show a card for each of them.  It should be the result of visiting `/banks`
6. Each card should have a link to the bank itself, of this form:  

    ```html
    <a href="/bank/3">Bank Name</a>
    ```

    Where the number after the bank is the index of the bank in the array of banks.

    **HINT** To do this, instead of Ruby's `each` iterator, you might want to use the `each_with_index` iterator.

7. Make a route to `get '/banks/:index'`, which then renders the show page based on the bank whose index (in the parsed JSON data) is equal to the `:index` param.  

  You'll need to get `params['index']`, parse it to an integer, and use that to look up the appropriate bank.  Store it in `@bank`, and use `erb` to render `show.erb`

8. Style the heck out of this micro-app using skeleton.
