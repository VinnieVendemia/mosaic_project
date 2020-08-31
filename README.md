# Mosaic code challenge.

This application was built following the mosaic code challenge guidelines.

## App Structure

I followed a typical Rails architecture when putting this together, there
is a ProjectsController and Project model for supporting the CRUD requests.

## Loading the data

I provided a task found in the lib directory that can be run
to load up the initial dataset.

Once your DB is setup and migrations have been run, open a rails
console and run:

```
LoadDatabase.load
```

## Tests

There are a few minimal test cases that have been provided for testing the
controller and model.

```
bundle exec rspec
```

## Next Steps

I think I would like to clean up the search query a bit.  I think
going forward it would be hard to maintain, especially if we wanted to add
more fields to query on.  Something like using a map for the empty params was
an approach I considered.
