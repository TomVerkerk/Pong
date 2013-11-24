package 
{
	import flash.display.Graphics;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.globalization.CurrencyParseResult;
	import flash.media.Sound;
	
	/**
	 * ...
	 * @author Tom Verkerk
	 */
	[SWF(width = "700", height = "700", frameRate = "29")]
	public class Main extends Sprite 
	{
		[Embed(source="../lib/credit scherm.jpg")]
		public var creds:Class;
		public var creditsScreen:Bitmap = new creds;
		[Embed(source="../lib/screen.jpg")]
		public var screen:Class;
		public var screenBitmap:Bitmap = new screen;
		[Embed(source = "../lib/Pongbox_Beginscherm.jpg")]
		public var startScreen:Class;
		public var startScreenBitmap:Bitmap = new startScreen;
		[Embed(source="../lib/mock_up.png")]
		public var background:Class;
		public var backgroundBitmap:Bitmap = new background;
		[Embed(source = "../lib/Pong_Boundries_Prototypes.png")]
		public var boundries:Class;
		public var boundriesBitmap:Bitmap = new boundries;
		
		public var ones:Boolean = false;
		public var goal:Sound = new Sound;
		public var bg:Sound = new Sound;
		public var buttonclick:Sound = new Sound;
		public var end:Sound = new Sound;
		public var hit:Sound = new Sound;
		public var intro:Sound = new Sound;
		
		public var wait:Boolean = true;
		public var played:Boolean = false;
		public var first:Boolean = false;
		public var playing:Boolean = false;
		public var helping:Boolean = false;
		public var credits:CreditsButton = new CreditsButton;
		public var help:HelpButton = new HelpButton;
		public var button:StartButton = new StartButton;
		public var start:Sprite;
		public var score:Score = new Score;
		public var player2move:int = 20;
		public var changed:Boolean = false;
		public var red:Boolean = true;
		public var time:Number = 0;
		public var timer:Number = 0;
		public var puck:Puck = new Puck;
		public var player1:Player = new Player;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			
			if (played == false && wait == false)
			{
				var intro:Intro = new Intro;
				played = true;
			}
			helping = false;
			playing = false;
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addChild(startScreenBitmap);
			credits.credits.addEventListener(MouseEvent.CLICK, creditScreen);
			stage.addChild(credits);
			help.helpSprite.addEventListener(MouseEvent.CLICK, helpScreen);
			stage.addChild(help);
			button.start.addEventListener(MouseEvent.CLICK, startGame);
			stage.addChild(button);
			}
		
		public function startGame(e:MouseEvent):void
		{
			if ( played == true)
			{
				Intro.introSound.stop();
				played = false;
			}
			wait = false;
			var buttonsound:Buttons = new Buttons;
			var background:Background = new Background;
			playing = true;
			button.start.removeEventListener(MouseEvent.CLICK, startGame);
			stage.removeChild(button);
			stage.removeChild(credits);
			stage.removeChild(help);
			puck.reset();
			puck.puckspeed = 7;
			addChild(backgroundBitmap);
			addChild(boundriesBitmap);
			addChild(player1);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, player1.keyPressedDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, player1.keyReleased);
			addChild(puck);
			score.player1Score = 0;
			score.player2Score = 0;
			addChild(score);
			stage.addEventListener(Event.ENTER_FRAME, update);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, backToMenu);
		}
		
		public function update (e:Event):void
		{
			puck.red = red;
			score.scoreLoop();
			timer += 1 / 10;
			//win function
			if (score.end == true)
			{
				removeEventListener(KeyboardEvent.KEY_DOWN, player1.keyPressedDown);
					removeEventListener(KeyboardEvent.KEY_UP, player1.keyReleased);
					removeChild(backgroundBitmap);
					removeChild(boundriesBitmap);
					removeChild(player1);
					removeChild(puck);
					removeChild(score);
					Background.bgSound.stop();
					stage.removeEventListener(Event.ENTER_FRAME, update);
					init();
					score.end = false;
			}
			// coll player1
			if ((player1.player1Bitmap.hitTestObject(puck))&& timer >= 1.2)
			{
				var hit:Hit = new Hit;
				
				if (Math.random() >= 0.5 )
				{
					puck.puckmove += (Math.random() * 5);
				}
				else {
					puck.puckmove -= (Math.random() * 5);
				}
				
				puck.puckspeed = puck.puckspeed * -1;
				puck.puckmove = puck.puckmove * -1;
				if (red == true)
				{
				puck.switchColor();
				red = false;
				}
				timer = 0;
			}
			
		
			//coll player2
			if ((player1.player2Bitmap.hitTestObject(puck))&& timer >= 1.2)
			{
				var hit:Hit = new Hit;
				
				puck.puckspeed = puck.puckspeed * -1;
				puck.puckmove = puck.puckmove * -1;
				if (Math.random() >= 0.5 )
				{
					puck.puckmove += (Math.random() * 5);
				}
				else {
					puck.puckmove -= (Math.random() * 5);
				}
				
				if (red == false)
				{
					puck.switchColor();
					red = true;
				}
				timer = 0;
			}
			//boundries and goal
			if (puck.redpuckBitmap.y <= 0)
			{
				if (puck.redpuckBitmap.x >= 230 && puck.redpuckBitmap.x + puck.redpuckBitmap.width <= 470)
				{
					puck.puckmove = 0;
					puck.puckspeed = 0;
					if (red == true)
						{
							var goal:Goal = new Goal;
							score.goal(true);
							puck.reset();
							puck.switchColor();
							red = false;
							changed = true;
						}
							if (red == false && changed == false)
						{
							var goal:Goal = new Goal;
							score.goal(false);
							puck.reset();
							puck.switchColor();
							red = false;
						}
						changed = false;
					}
				}
				else
				{
					puck.puckmove = puck.puckmove * -1;
				}
			if (puck.redpuckBitmap.y + puck.redpuckBitmap.height >= 700)
			{
				if (puck.redpuckBitmap.x >= 230 && puck.redpuckBitmap.x + puck.redpuckBitmap.width <= 470)
				{
					puck.puckmove = 0;
					puck.puckspeed = 0;
					if (red == true)
						{
							var goal:Goal = new Goal;
							score.goal(true);
							puck.reset();
							puck.switchColor();
							red = false;
							changed = true;
						}
							if (red == false && changed == false)
						{
							var goal:Goal = new Goal;
							score.goal(false);
							puck.reset();
							puck.switchColor();
							red = true;
						}
					changed = false;
					}
				}
				else
				{
					puck.puckmove = puck.puckmove * -1;
				}
			if (puck.redpuckBitmap.x <= 0)
			{
				if (puck.redpuckBitmap.y >= 230 && puck.redpuckBitmap.y + puck.redpuckBitmap.height <= 470)
				{
					puck.puckmove = 0;
					puck.puckspeed = 0;
					if (red == true)
						{
							var goal:Goal = new Goal;
							score.goal(true);
							puck.reset();
							puck.switchColor();
							red = false;
							changed = true;
						}
					if (red == false && changed == false)
						{
							var goal:Goal = new Goal;
							score.goal(false);
							puck.reset();
							puck.switchColor();
							red = true;
						}
					changed = false;
					}
				}
				else
				{
					puck.puckspeed = puck.puckspeed * -1;
				}
			if (puck.redpuckBitmap.x + puck.redpuckBitmap.width >= 700)
			{
				if (puck.redpuckBitmap.y >= 230 && puck.redpuckBitmap.y + puck.redpuckBitmap.height <= 470)
				{
					puck.puckmove = 0;
					puck.puckspeed = 0;
					if (red == true)
						{
							var goal:Goal = new Goal;
							score.goal(true);
							puck.reset();
							puck.switchColor();
							red = false;
							changed = true;
						}
					if (red == false && changed == false)
						{
							var goal:Goal = new Goal;
							score.goal(false);
							puck.reset();
							puck.switchColor();
							red = true;
						}
					changed = false;
					}
				}
				else
				{
					puck.puckspeed = puck.puckspeed * -1;
				}
		}
		public function helpScreen (e:MouseEvent):void {
			var buttonsound:Buttons = new Buttons;
			helping = true;
			stage.removeChild(button);
			stage.removeChild(help);
			stage.removeChild(credits);
			addChild(screenBitmap);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, backToMenu);
		}
		
		public function backToMenu(e:KeyboardEvent):void {
			if (e.keyCode == 27)
			{
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, backToMenu);
				if (helping == true)
				{
					removeChild(screenBitmap);
				}
				if (helping == false && playing == false)
				{
					removeChild(creditsScreen);
				}
				if (helping == false && playing == true)
				{
					removeEventListener(KeyboardEvent.KEY_DOWN, player1.keyPressedDown);
					removeEventListener(KeyboardEvent.KEY_UP, player1.keyReleased);
					removeChild(backgroundBitmap);
					removeChild(boundriesBitmap);
					removeChild(player1);
					removeChild(puck);
					removeChild(score);
					Background.bgSound.stop();
					stage.removeEventListener(Event.ENTER_FRAME, update);
				}
				init();
			}
		}
		
		public function creditScreen(e:MouseEvent):void {
			var buttonsound:Buttons = new Buttons;
			stage.removeChild(button);
			stage.removeChild(help);
			stage.removeChild(credits);
			addChild(creditsScreen);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, backToMenu);
		}
	}
}