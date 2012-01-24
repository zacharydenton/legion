A distributed web crawler with a central "brain".

The brain is a database with a list of pages crawled, a queue of pages
to crawl, and whatever information the crawler is searching for.

Workers connect to the brain and fetch the top of the queue. This page
is removed from the queue and added to the list of pages crawled, and 
the page is processed. The data extracted from the page is added to 
the database. All of the links on the page are added to the bottom of
the queue (if they haven't already been seen).

The beauty of this system is that the workers can be running on any
machine. Think hive mind. The crawler could scale to massive proportions,
if the data being gathered is important enough.

The implementation should be generic. The only thing that needs to be
added to turn the generic implementation into a useful crawler is
a processing function (e.g. extracting email addresses and adding them
to the database).

Things that could be crawled:

* email addresses
* usernames/passwords
