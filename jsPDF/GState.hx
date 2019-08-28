package jsPDF;

@:native('GState')
extern class GState {

	public function new();

	public var id:String;
	public var objectNumber:Int;
	public var opacity:Dynamic;

	@:native('stroke-opacity')
	public var strokeOpacity:Dynamic;

}
