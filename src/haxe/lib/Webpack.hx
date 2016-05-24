import haxe.macro.Expr;

class Webpack
{
	/**
	 * Asynchronously load and evaluate a list of modules.
	 * eg. Haxe modules will have been merged in the scope and stylesheets will have been applied
	 */
	macro static public function ensure(modules:ExprOf<Array<String>>, ready:ExprOf<Void->Void>) 
	{
		return macro untyped require($modules, function() {
			$ready();
		});
	}
	
	/**
	 * Synchronously require a module (will be bundled with the rest of the code).
	 * eg. JS modules, stylesheets, images (as data-url or urls), text resources...
	 */
	macro static public function require(module:ExprOf<String>)
	{
		return macro untyped require($module);
	}
	
	/**
	 * Register a hot-reload handler for the provided list of modules.
	 * - if no dependencies are indicated, everything will be handled,
	 * - if no callback is provided, modules will be auto-accepted.
	 */
	macro static public function hotReload(?dep:ExprOf<String>, ?fn:ExprOf<Void->Void>) 
	{
		var args = [];
		if (!isNull(dep)) args.push(dep);
		if (!isNull(fn)) args.push(fn);
		return macro if (untyped module.hot) untyped module.hot.accept($a{args});
	}
	
	#if macro
	static function isNull(e:Expr) 
	{
		if (e == null) return true;
		return switch (e.expr) {
			case EConst(CIdent('null')): true;
			default: false;
		}
	}
	#end
}
