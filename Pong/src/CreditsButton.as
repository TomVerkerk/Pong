package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Tom Verkerk
	 */
	public class CreditsButton extends Sprite
	{
		[Embed(source = "../lib/credits.png")]
		public var credit:Class;
		public var creditBitmap:Bitmap = new credit;
		
		public var credits:Sprite;
		
		public function CreditsButton() 
		{
			creditBitmap.x = 250;
			creditBitmap.y = 500;
			addChild(creditBitmap);
			credits = new Sprite();
			credits.graphics.beginFill(0xFF0000, 0.0);
			credits.graphics.lineStyle(1, 0x000000, 0.0, true);
			credits.graphics.drawRect(250, 500, 200, 50);
			credits.graphics.endFill();
			credits.buttonMode = true;
			credits.useHandCursor = true;
			credits.mouseChildren = false;
			addChild(credits);
		}
		
	}

}