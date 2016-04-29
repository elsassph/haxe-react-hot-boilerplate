import api.react.ReactDOM;
import api.react.ReactComponent;
import api.react.ReactMacro.jsx;
import js.Browser;
import view.App;

class Main
{
	static function main() 
	{
		trace('main()');
		
		Webpack.ensure(['./view'], function() {
			
			ReactDOM.render(
				jsx('<AppContainer component=$App />'), 
				Browser.document.getElementById('root'));
			
		});
		
		Webpack.hotReload();
	}
}

@:jsRequire('react-hot-loader', 'AppContainer')
extern class AppContainer extends ReactComponent { }

