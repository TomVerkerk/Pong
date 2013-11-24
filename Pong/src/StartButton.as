package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Tom Verkerk
	 */
	public class StartButton extends Sprite
	{
		[Embed(source = "../lib/start.png")]
		public var button:Class;
		public var buttonBitmap:Bitmap = new button;
		
		public var start:Sprite;
		
		public function StartButton() 
		{
			buttonBitmap.x = 250;
			buttonBitmap.y = 400;
			addChild(buttonBitmap);
			start = new Sprite();
			start.graphics.beginFill(0xFF0000, 0.0);
			start.graphics.lineStyle(1, 0x000000, 0.0, true);
			start.graphics.drawRect(250, 400, 200, 50);
			start.graphics.endFill();
			start.buttonMode = true;
			start.useHandCursor = true;
			start.mouseChildren = false;
			addChild(start);
		}
		
	}

}