haxe-react-hot-boilerplate
=====================

The minimal dev environment to enable live-editing React components with Haxe.
Based on Dan Abramov's (http://github.com/gaearon) `react-hot-boilerplate`.

### Usage

#### Webpack

```
npm install
npm start
open http://localhost:3000
```

#### Haxe

**Building**

```
# build all
haxe build.hxml

# build watcher for views
npm run haxify
```

Now edit `src/haxe/main/*`. Your changes will appear without reloading the browser.

**Webpack API**

```haxe
var foo = Webpack.require(./foo);

Webpack.ensure(['./styles/foo.css', './foo'], function() {
	// styles and foo loaded
});

Webpack.hotReload();
Webpack.hotReload('./foo');
Webpack.hotReload('./foo', function() {
	// foo reloaded
});
```

**Modularity**

Haxe modularity is achieved using the technique described in https://github.com/elsassph/modular-haxe-example.
Inspect the `.hxml` files for configuration.


### Using `0.0.0.0` as Host

You may want to change the host in `server.js` and `webpack.config.js` from `localhost` to `0.0.0.0` to allow access from same WiFi network. 
This is not enabled by default because it is reported to cause problems on Windows. This may also be useful if you're using a VM.

### Missing Features

This boilerplate is purposefully simple to show the minimal configuration for React Hot Loader. For a real project, you'll want to add a 
separate config for production with hot reloading disabled and minification enabled. You'll also want to add a router, styles and maybe 
combine dev server with an existing server. This is out of scope of this boilerplate.

### Dependencies

* React
* Webpack
* [webpack-dev-server](https://github.com/webpack/webpack-dev-server)
* [react-hot-loader](https://github.com/gaearon/react-hot-loader)

### Resources

* [Demo video](http://vimeo.com/100010922)
* [react-hot-loader on Github](https://github.com/gaearon/react-hot-loader)
* [Integrating JSX live reload into your workflow](http://gaearon.github.io/react-hot-loader/getstarted/)
* [Troubleshooting guide](https://github.com/gaearon/react-hot-loader/blob/master/docs/Troubleshooting.md)
* Ping dan_abramov on Twitter or #reactjs IRC
* Ping elsassph on Twitter
