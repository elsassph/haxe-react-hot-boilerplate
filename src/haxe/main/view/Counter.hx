package view;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;
import haxe.Timer;

class Counter extends ReactComponent
{
	var interval:Timer;
	
	public function new(props)
	{
		super(props);
		trace('new Counter()');
		state = { counter: 0 };
	}
	
	override public function componentDidMount()
	{
		trace('mount counter');
		interval = new Timer(1000);
		interval.run = tick;
	}
	
	function tick() 
	{
		setState({ counter: state.counter + 1 });
	}
	
	override function componentWillUnmount()
	{
		trace('unmount counter');
		interval.stop();
	}
	
	override function render()
	{
		var styles = {
			background:'yellow',
			padding:'10px'
		};
		return jsx('
			<h2 style=$styles onClick=$click>
				Counter: ${state.counter}
				<hr/>
				<Button>That button!</Button>
			</h2>
		');
	}
	
	function click() {
		trace('clicked');
	}
}
