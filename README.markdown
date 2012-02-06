## Introduction

A distributed web crawler with a central "brain".

## Usage

To start the crawler, make sure there is at least one Site in the
database. Then, run

    script/delayed_job start

If you set this up with a database that can be accessed remotely,
then you can use as many machines as you want to crawl
simultaneously.

## Extending

To teach the crawler about new kinds of information you would like
it to gather, just add new methods to the `Processors` class in
`lib/processors.rb`.



