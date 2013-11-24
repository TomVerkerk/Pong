package  
{
	import flash.display.Graphics;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Tom Verkerk
	 */
	public class Puck extends Sprite
	{
		[Embed(source="../lib/red.png")]
		public var redpuck:Class;
		public var redpuckBitmap:Bitmap = new redpuck;
		[Embed(source = "../lib/blue.png")]
		public var bluepuck:Class;
		public var bluepuckBitmap:Bitmap = new bluepuck;
		
		public var red:Boolean;
		public var random:int;
		public var puckspeed:int;
		public var puckmove:int = 3;
		
		public function Puck() 
		{
			redpuckBitmap.x = 350;
			redpuckBitmap.y = 400;
			redpuckBitmap.scaleX = 0.2;
			redpuckBitmap.scaleY = 0.2;
			bluepuckBitmap.x = 350;
			bluepuckBitmap.y = 400;
			bluepuckBitmap.scaleX = 0.2;
			bluepuckBitmap.scaleY = 0.2;
			addChild(bluepuckBitmap);
			removeChild(bluepuckBitmap);
			addChild(redpuckBitmap);
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function reset():void {
			redpuckBitmap.x = 350;
			redpuckBitmap.y = 350;
			bluepuckBitmap.x = 350;
			bluepuckBitmap.y = 350;
			puckmove = 0;
			puckspeed = 7;
			if (random >= 0.5)
			{
				puckspeed = puckspeed * -1;
			}
		}
		
		public function update(e:Event):void {
			random = Math.random();
			redpuckBitmap.x -= puckspeed;
			redpuckBitmap.y -= puckmove;
			bluepuckBitmap.x -= puckspeed;
			bluepuckBitmap.y -= puckmove;
		}
		
		public function switchColor():void {
			if (red == true)
			{
				addChild(bluepuckBitmap);
				removeChild(redpuckBitmap);
			}
			if (red == false)
			{
				addChild(redpuckBitmap);
				removeChild(bluepuckBitmap);
			}
		}
		
	}

}