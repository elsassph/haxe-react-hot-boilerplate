import haxe.macro.Expr;

class Webpack
{
	macro static public function ensure(modules:ExprOf<Array<String>>, ready:ExprOf<Void->Void>) 
	{
		var reqs = [];
		switch (modules.expr) {
			case EArrayDecl(values):
				for (value in values) 
					reqs.push(macro require($value));
			default:
		}
		return macro untyped require.ensure($modules, function() {
			$b{reqs}
			$ready();
		});
	}
	
	macro static public function require(module:ExprOf<String>)
	{
		return macro untyped require($module);
	}
	
	macro static public function hotReload(?dep:ExprOf<String>, ?fn:ExprOf<Void->Void>) 
	{
		var args = [];
		if (!isNull(dep)) args.push(dep);
		if (!isNull(fn)) args.push(fn);
		return macro untyped module.hot.accept($a{args});
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
