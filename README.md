# Artist Portal

Auto Agent allows for administrative users to assign artists to other users.
When an artist is assigned to a user, they can then see all details regarding
the artist's upcoming performances and top albums (provided by last.fm).

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install
```

Next, migrate the database:

```
$ rails db:migrate
```

Seed the database:

```
$ rails db:seed
```

Add a LAST_FM_API_KEY in the 'application.yml' file. The API Key can be obtained
at https://www.last.fm/api/account/create or sending an email to
bkohler4@gmail.com to request one.

```
LAST_FM_API_KEY: "key"
```

Finally you can run the app in a local server:

```
$ rails server
```

For more information or any questions, contact Bill Kohler @ bkohler4@gmail.com
