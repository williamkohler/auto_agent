# Artist Portal

Auto Agent allows for administrative users to assign artists to other users.
When an artist is assigned to a user, that user can then see the artists
upcoming performances and top albums (from last.fm).


## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install
```

Next, migrate the database:

```
$ rails db:migrate
```

Seed the database with data:

```
$ rails db:seed
```

Create an 'application.yml' file in the cofig directory and add a
LAST_FM_API_KEY (one can be requested from bkohler4@gmail.com or obtained at
https://www.last.fm/api/account/create)

```
LAST_FM_API_KEY: "key"
```


Finally you can run the app in a local server:

```
$ rails server
```

For more information, contact Bill Kohler @ bkohler4@gmail.com
