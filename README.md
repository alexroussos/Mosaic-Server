# Mosaic Server

A web interface for my [Mosaic Generator project][] which is powered by Jetty running on Heroku. You can view the web app [here][].

## Running the application locally

First build with:

    $mvn clean install

Then run it with:

    $java -cp target/classes:target/dependency/* com.example.Main

[Mosaic Generator project]: https://github.com/alexroussos/Mosaic
[here]: http://mosaic-server.herokuapp.com/
