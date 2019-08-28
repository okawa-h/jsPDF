package jsPDF;

import jsPDF.GState;
import jsPDF.Matrix;
import haxe.extern.EitherType;

@:enum abstract Orientation(String) {
	var PORTRAIT = 'portrait';
	var LANDSCAPE = 'landscape';
	var P = 'p';
	var L = 'l';
}

@:enum abstract Unit(String) {
	var PT = 'pt';
	var MM = 'mm';
	var CM = 'cm';
	var M = 'm';
	var IN = 'in';
	var PX = 'px';
}

@:enum abstract FormatSize(String) {
	var A0 = 'a0';
	var A1 = 'a1';
	var A2 = 'a2';
	var A3 = 'a3';
	var A4 = 'a4';
	var A5 = 'a5';
	var A6 = 'a6';
	var A7 = 'a7';
	var A8 = 'a8';
	var A9 = 'a9';
	var A10 = 'a10';

	var B0 = 'b0';
	var B1 = 'b1';
	var B2 = 'b2';
	var B3 = 'b3';
	var B4 = 'b4';
	var B5 = 'b5';
	var B6 = 'b6';
	var B7 = 'b7';
	var B8 = 'b8';
	var B9 = 'b9';
	var B10 = 'b10';

	var C0 = 'c0';
	var C1 = 'c1';
	var C2 = 'c2';
	var C3 = 'c3';
	var C4 = 'c4';
	var C5 = 'c5';
	var C6 = 'c6';
	var C7 = 'c7';
	var C8 = 'c8';
	var C9 = 'c9';
	var C10 = 'c10';

	var DL = 'dl';
	var LETTER = 'letter';
	var GOVERNMENT_LETTER = 'government-letter';
	var LEGAL = 'legal';
	var JUNIOR_LEGAL = 'junior-legal';
	var LEDGER = 'ledger';
	var TABLOID = 'tabloid';
	var CREDIT_CARD = 'credit-card';
}

@:enum abstract RenderingModeType(String) {
	var FILL = 'fill';
	var STROKE = 'stroke';
	var FILL_THEN_STROKE = 'fillThenStroke';
	var INVISIBLE = 'invisible';
	var FILL_AND_ADD_FOR_CLIPPING = 'fillAndAddForClipping';
	var STROKE_AND_ADD_PATH_FOR_CLIPPING = 'strokeAndAddPathForClipping';
	var FILL_THEN_STROKE_AND_ADD_TO_PATH_FOR_CLIPPING = 'fillThenStrokeAndAddToPathForClipping';
	var ADD_TO_PATH_CLIPPING = 'addToPathForClipping';
}

typedef Options = {
	?orientation:Orientation,
	?unit:Unit,
	?format:EitherType<FormatSize,Array<Float>>,
	?putOnlyUsedFonts:Bool,
	?compress:Bool,
	?precision:Int,
	?userUnit:Float
}

typedef TextOptions = {
	?align:String,
	?baseline:String,
	?angle:String,
	?rotationDirection:String,
	?charSpace:String,
	?lineHeightFactor:String,
	?flags:String,
	?maxWidth:String,
	?renderingMode:RenderingModeType,
	?isInputVisual:Bool,
	?isOutputVisual:Bool,
	?isInputRtl:Bool,
	?isOutputRtl:Bool,
	?isSymmetricSwapping:Bool
}

typedef Format = EitherType<FormatSize,Array<Float>>;

@:native('jsPDF')
extern class JsPDF {

	public static var __bidiEngine__:Dynamic;
	public static var API:Dynamic;
	public static var CapJoinStyles:Dynamic;

	public var comment:String->JsPDF;
	public var margins:Int;
	public var version:String;

	@:overload(function(?orientation:String,?unit:String,?format:Format,?compressPdf:Bool):JsPDF{})
	public function new(?options:Options);

	public function addFont(postScriptName:String,id:String,fontStyle:String,encoding:Dynamic):String;
	public function addGState(key:String,gState:GState):JsPDF;
	public function addPage(format:Format,orientation:Orientation):JsPDF;

	public function beginFormObject(x:Float,y:Float,width:Float,height:Float,matrix:Matrix):JsPDF;
	public function circle(x:Float,y:Float,r:Float,style:String):JsPDF;
	public function clip(rule:String):JsPDF;
	public function clipEvenOdd():JsPDF;
	public function close():JsPDF;
	public function curveTo(x1:Float,y1:Float,x2:Float,y2:Float,x3:Float,y3:Float):JsPDF;
	public function deletePage(targetPage:Float):JsPDF;
	public function discardPath():JsPDF;
	public function doFormObject(key:String,matrix:Matrix):JsPDF;
	public function ellipse(x:Float,y:Float,rx:Float,ry:Float,style:String):JsPDF;
	public function endFormObject(key:String):JsPDF;
	public function fill(?pattern:Dynamic):JsPDF;
	public function fillEvenOdd(?pattern:Dynamic):JsPDF;
	public function fillStroke(?pattern:Dynamic):JsPDF;
	public function fillStrokeEvenOdd(?pattern:Dynamic):JsPDF;

	public function getCharSpace():Float;
	public function getCreationDate(type:Dynamic):Dynamic;
	public function getDrawColor():String;
	public function getFileId():String;
	public function getFillColor():String;
	public function getFont():Dynamic;
	public function getFontList():Dynamic;
	public function getFontSize():Float;

	@:overload(function(key:String):Dynamic{})
	public function getFormObject(key:String):JsPDF;

	public function getLineHeightFactor():Float;
	public function getR2L():Bool;
	public function getTextColor():String;
	public function insertPage(beforePage:Dynamic):JsPDF;

	@:overload(function(lines:Dynamic,x:Float,y:Float,scale:Float,style:String,closed:Bool):JsPDF{})
	public function line(x1:Float,y1:Float,x2:Float,y2:Float,style:String):JsPDF;

	public function lineTo(x:Float,y:Float):JsPDF;

	@:overload(function(text:Array<String>,x:Float,y:Float,spacing:Float):JsPDF{})
	public function lstext(text:String,x:Float,y:Float,spacing:Float):JsPDF;

	public function movePage(targetPage:Int,beforePage:Int):JsPDF;
	public function moveTo(x:Float,y:Float):JsPDF;
	public function output(type:String,options:Dynamic):JsPDF;

	@:overload(function(lines:Dynamic,?style:String,?patternKey:String,?patternData:Dynamic):JsPDF{})
	public function path(lines:Dynamic,?style:String,?patternKey:String,?patternData:Matrix):JsPDF;

	public function rect(x:Float,y:Float,w:Float,h:Float,style:String):JsPDF;
	public function restoreGraphicsState():JsPDF;
	public function roundedRect(x:Float,y:Float,w:Float,h:Float,rx:Float,ry:Float,style:String):JsPDF;

	public function save(filename:String,?options:Dynamic):JsPDF;
	public function saveGraphicsState():JsPDF;

	public function setCharSpace(charSpace:Float):JsPDF;
	public function setCreationDate(date:Dynamic):JsPDF;
	public function setCurrentTransformationMatrix(matrix:Matrix):JsPDF;
	public function setDisplayMode(zoom:EitherType<String,Int>,layout:String,pmode:String):JsPDF;
	public function setDocumentProperties(A:Dynamic):JsPDF;
	public function setDrawColor(ch1:EitherType<String,Int>,ch2:Int,ch3:Int,ch4:Int):JsPDF;
	public function setFileId(value:String):JsPDF;
	public function setFillColor(ch1:EitherType<String,Int>,ch2:Int,ch3:Int,ch4:Int):JsPDF;
	public function setFont(fontName:String,fontStyle:String):JsPDF;
	public function setFontSize(size:Float):JsPDF;
	public function setFontStyle(style:String):JsPDF;
	public function setGState(gState:EitherType<String,GState>):JsPDF;
	public function setLineCap(style:EitherType<String,Float>):JsPDF;
	public function setLineDashPattern(dashArray:Array<Float>,dashPhase:Float):JsPDF;
	public function setLineHeightFactor(value:Float):JsPDF;
	public function setLineJoin(style:EitherType<String,Float>):JsPDF;
	public function setLineMiterLimit(length:Int):JsPDF;
	public function setLineWidth(width:Float):JsPDF;
	public function setPage(page:Int):JsPDF;
	public function setR2L(value:Bool):JsPDF;
	public function setTextColor(ch1:EitherType<String,Int>,ch2:Int,ch3:Int,ch4:Int):JsPDF;

	public function stroke():JsPDF;
	public function text(text:EitherType<String,Array<String>>,x:Float,y:Float,?options:TextOptions,?transform:EitherType<Float,Matrix>):JsPDF;
	public function triangle(x1:Float,y1:Float,x2:Float,y2:Float,x3:Float,y3:Float,style:String):JsPDF;

}
