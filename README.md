

# Price Comparison App

This app is made in Flutter, with a Python Flask backend. Stores supported currently are: Walmart, Target, Bestbuy. Walgreens, Staples, and TigerDirect.

# Prerequisites
The app uses a Flask Python backend to work properly.
* Flask==1.1.2
* Flask-Cors==3.0.8
* requests
* flutter & dart

## Starting the backend

```sh
$ cd API

$ flask run
```

The API backend is now running on port 5000. (localhost:5000)


## Starting the front-end app (Flutter)

```sh
$ flutter run -d your-device
```
You should now be able to view the app.

# Building the app

```sh
$ flutter build web
```

The built files should be located in the build folder.