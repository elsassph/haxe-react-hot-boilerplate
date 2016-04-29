package view;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

class Button extends ReactComponent
{

	override public function render():ReactComponent 
	{
		return jsx('
			<button>{props.children}</button>
		');
	}
	
}