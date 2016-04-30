import api.react.ReactDOM;
import api.react.ReactComponent;
import api.react.ReactMacro.jsx;
import js.Browser;
import view.App;

class Main
{
	static function main() 
	{
		trace('main()!');

		render();
		Webpack.hotReload('./view', render);
	}
	
	static function render()
	{
		Webpack.ensure(['./view'], function() {
			ReactDOM.render(
				jsx('<AppContainer><App/></AppContainer>'), 
				Browser.document.getElementById('root'));
		});
	}
}

@:jsRequire('react-hot-loader', 'AppContainer')
extern class AppContainer extends ReactComponent { }

