package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.FullScreenEvent;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Tom Verkerk
	 */
	public class HelpButton extends Sprite
	{
		[Embed(source = "../lib/help.png")]
		public var help:Class;
		public var helpBitmap:Bitmap = new help;
		
		public var helpSprite:Sprite;
		
		public function HelpButton() 
		{
			helpBitmap.x = 250;
			helpBitmap.y = 600;
			addChild(helpBitmap);
			helpSprite = new Sprite();
			helpSprite.graphics.beginFill(0xFF0000, 0.0);
			helpSprite.graphics.lineStyle(1, 0x000000, 0.0, true);
			helpSprite.graphics.drawRect(250, 600, 200, 50);
			helpSprite.graphics.endFill();
			helpSprite.buttonMode = true;
			helpSprite.useHandCursor = true;
			helpSprite.mouseChildren = false;
			addChild(helpSprite);
		}
	}

}