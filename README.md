ppt-Blog
========

###Installation

To install the dependencies run the following commands

<pre>Bower Install</pre>
<pre>bundle install</pre>

To install <a href="http://bower.io/#install-bower">Bower</a> or<a href="http://bundler.io/"> Bundler</a> see the following links

###About the app

The app was made using Sinatra and it contains the following routes(asumming you are using the default port 4567 ):


* '/author/:id' => http://localhost:4567/author/Pixelator
* '/post/:id' => http://localhost:4567/post/2
* '/tags/:id' => http://localhost:4567/tags/recreation
* '/about' => http://localhost:4567/about
* '/' => http://localhost:4567/


###notes


* The app is a very simple one that only shows data and queries depending on the values send via the routes parameters.
* The posts are read directly from the posts.json file.
* start the app run the server from the root folder using `ruby main.rb`.
* The tests were written using Rspect so to test them use `rspec spec`.
