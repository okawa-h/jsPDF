package jsPDF;

@:native('Matrix')
extern class Matrix {

	public function new(sx:Float,shy:Float,shx:Float,sy:Float,tx:Float,ty:Float);

	public var isIdentity:Bool;
	public var rotation:Float;
	public var scaleX:Float;
	public var scaleY:Float;
	public var shx:Float;
	public var shy:Float;
	public var sx:Float;
	public var sy:Float;
	public var tx:Float;
	public var ty:Float;

	public function applyToPoint():Dynamic;
	public function applyToRectangle():Dynamic;
	public function clone():Matrix;
	public function decompose():{ scale:Matrix,translate:Matrix,rotate:Matrix,skew:Matrix };
	public function inversed():Matrix;
	public function join(separator:String):String;
	public function multiply(matrix:Matrix):Matrix;
	public function toString():String;

}
