package  
{
	import flash.display.Bitmap;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.events.KeyboardEvent;
	import flash.net.Responder;
	/**
	 * ...
	 * @author Tom Verkerk
	 */
	public class Player extends Sprite
	{
		[Embed(source = "../lib/player1.png")]
		public var player1:Class;
		public var player1Bitmap:Bitmap = new player1;
		[Embed(source = "../lib/player2.png")]
		public var player2:Class;
		public var player2Bitmap:Bitmap = new player2;
		
		public var point1:Point = new Point(350, 350);// The MovieClip That Is Orbited
		public var angle:Number = 160; // The Initial Angle Orbiting Starts From
		public var speed:Number = 0; // Number Of Pixels Orbited Per Frame
		public var radius:Number = 250; // Orbiting Distance From Origin
			
		public var point2:Point = new Point(350, 350);// The MovieClip That Is Orbited
		public var angle2:Number = 0; // The Initial Angle Orbiting Starts From
		public var speed2:Number = 0; // Number Of Pixels Orbited Per Frame
		public var radius2:Number = 250; // Orbiting Distance From Origin
				
		
		public function Player() 
		{
			addChild(player2Bitmap);
			addChild(player1Bitmap);
			addEventListener(Event.ENTER_FRAME, update);
		}
		public function keyPressedDown(e:KeyboardEvent):void
		{
			if (e.keyCode ==  49)
			{
				speed = 9;
			}
			else if (e.keyCode ==  50)
			{
				speed = -9;
			}
			if (e.keyCode == 57)
			{
				speed2 = 9;
			}
			else if (e.keyCode == 48)
			{
				speed2 = -9;
			}
		}
		public function keyReleased(e:KeyboardEvent):void
		{
			if (e.keyCode ==  49 )
			{
				speed = 0;
			}
			if (e.keyCode ==  50)
			{
				speed = 0;
			}
			if (e.keyCode == 57)
			{
				speed2 = 0;
			}
			if (e.keyCode == 48)
			{
				speed2 = 0;
			}
		}
		
		public function update(e:Event):void {
			
			var rad2:Number = angle2 * (Math.PI / 180);
			var rad:Number = angle * (Math.PI / 180);
			
			player1Bitmap.x = (point1.x + radius * Math.cos(rad));
			player1Bitmap.y = (point1.y + radius * Math.sin(rad)) - 50;
			
			player2Bitmap.x = (point2.x + radius * Math.cos(rad2));
			player2Bitmap.y = (point2.y + radius * Math.sin(rad2)) - 50;
			
			angle += speed;
			angle2 += speed2;
			
			player1Bitmap.rotation  = (Math.atan2(player1Bitmap.y -point1.y, player1Bitmap.x -point1.x) * 180 / Math.PI) + 12;
			player2Bitmap.rotation  = (Math.atan2(player2Bitmap.y -point2.y, player2Bitmap.x -point2.x) * 180 / Math.PI) + 12;
		}
	}
}