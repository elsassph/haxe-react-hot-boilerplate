package view;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

class Button extends ReactComponent
{

	override function render()
	{
		return jsx('
			<button {...props}>
				{props.children}
			</button>
		');
	}
	
}