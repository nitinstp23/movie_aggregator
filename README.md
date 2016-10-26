# Movie Aggregator

A console based app that accepts movie details as command line args and exports them to a user chosen format.

**Movie Details** -

* `Name`
* `Run Time`
* `Language`
* `Lead Actor`
* `Genre`

**Export Formats** -

* `text`
* `pdf`
...more can be added

## SETUP

* `git clone git@github.com:nitinstp23/movie_aggregator.git`
* `cd movie_aggregator`
* `bundle install`
* `sudo touch /var/log/movie_aggregator.log`
* `sudo chmod 0666 /var/log/movie_aggregator.log`
* `chmod +x movie_aggregator`
* Run `./movie_aggregator` to get list of available commands
* Check logs - `tail -f /var/log/movie_aggregator.log`
