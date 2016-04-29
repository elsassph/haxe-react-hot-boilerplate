package view;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

@:expose
class App extends ReactComponent
{
	public function new()
	{
		super();
		trace('new App()');
	}
	
	override function render()
	{
		return jsx('
			<Layout>
				<Counter />
			</Layout>
		');
	}
	
	function Layout(props)
	{
		return jsx('
			<div>
				<h1>Hello, world!</h1>
				{props.children}
			</div>
		');
	}
}
