package js.jsPDF;

import haxe.extern.EitherType;

@:native('jsPDF')
extern class JsPDF {

	public var margins : Int;
	public var version : String;

	public function new(orientation:String,unit:String,format:EitherType<String,Array<Int>>,compressPdf:Bool=false):Void;
	public function addImage(imageData:String,format:String='PNG',x:Float=0,y:Float=0,w:Float=0,h:Float=0,?alias:String,?compression:String,?rotation:String):Void {}

	public function addPage():JsPDF {}
	public function setPage(index:Int):JsPDF {}
	public function insertPage(beforePage:Int):JsPDF {}
	public function movePage(targetPage:Int,beforePage:Int):JsPDF {}
	public function deletePage(index:Int):JsPDF {}

	public function setDisplayMode(zoom:String,layout:String,pmode:String):JsPDF {}
	public function text():JsPDF {}
	public function lstext(text:String,x:Float,y:Float,spacing:Float):JsPDF {}

	public function line(x1:Float,y1:Float,x2:Float,y2:Float):Dynamic {}
	public function clip():Void {}
	public function lines(lines:Dynamic,x:Dynamic,y:Dynamic,scale:Dynamic,style:String,closed:Bool):JsPDF {}
	public function rect(x:Float,y:Float,w:Float,h:Float,style:String):JsPDF {}
	public function triangle(x1:Float,y1:Float,x2:Float,y2:Float,x3:Float,y3:Float,style:String):JsPDF {}
	public function roundedRect(x:Float,y:Float,w:Float,h:Float,rx:Float,ry:Float,style:String):JsPDF {}
	public function ellipse(x:Float,y:Float,rx:Float,ry:Float,style:String):JsPDF {}
	public function circle(x:Float,y:Float,r:Float,style:String):JsPDF {}

	public function setProperties(properties:{
		?title   : String,
		?subject : String,		
		?author  : String,
		?keywords: String,
		?creator : String
	}):JsPDF {}

	public function setFontSize(size:Int):JsPDF {}
	public function setFont(fontName:String,fontStyle:String):JsPDF {}
	public function setFontStyle(style:String):JsPDF {}
	public function setFontType(type:String):JsPDF {}
	public function getFontList():Dynamic {}
	public function addFont(postScriptName:String,fontName:String,fontStyle:String):String {}

	public function setLineWidth(width:Float):JsPDF {}
	public function setDrawColor(ch1:Float,ch2:Float,ch3:Float,ch4:Float):JsPDF {}
	public function setFillColor(ch1:Float,ch2:Float,ch3:Float,ch4:Float):JsPDF {}
	public function setTextColor(r:Float,g:Float,b:Float):JsPDF {}
	public function setLineCap(style:String):JsPDF {}
	public function setLineJoin(style:String):JsPDF {}

	public function output(?type:String,?options:Dynamic):Dynamic {}
	public function save(filename:String):Void {}

}
