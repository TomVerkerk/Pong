package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Tom Verkerk
	 */
	public class Score extends Sprite
	{
		[Embed(source = "../lib/1900805.ttf", fontFamily = 'foo', embedAsCFF = 'false')]
		public var bar:String;
		
		public var end:Boolean = false;
		public var player1Score: int;
		public var player2Score: int;
		public var myFormat: TextFormat;
		public var playerScoreText:TextField;
		public var aiScoreText: TextField;
		
		public function Score() 
		{
			player1Score = 0;
			player2Score = 0;
			
			myFormat = new TextFormat();
			myFormat.color = 0xFFFFFF;
			myFormat.size = 200;
			myFormat.align = "center";
			myFormat.font = "foo";
			
			playerScoreText = new TextField;
			playerScoreText.defaultTextFormat = myFormat;
			playerScoreText.embedFonts = true;
			playerScoreText.selectable = false;
			playerScoreText.x = 405;
			playerScoreText.y = 275;
			playerScoreText.width = 200;
			playerScoreText.height = 150;
			playerScoreText.setTextFormat(myFormat);
			
			aiScoreText = new TextField;
			aiScoreText.defaultTextFormat = myFormat;
			aiScoreText.embedFonts = true;
			aiScoreText.selectable = false;
			aiScoreText.x = 100;
			aiScoreText.y = 275;
			aiScoreText.width = 200;
			aiScoreText.height = 150;
			aiScoreText.setTextFormat(myFormat);
			
			addChild(playerScoreText);
			addChild(aiScoreText);
		}
		
		public function goal(red:Boolean):void
		{
			if (red == true)
			{
				player1Score ++;
			}
			if (red == false)
			{
				player2Score ++;
			}
		}
		
		public function scoreLoop():void
		{
			if (getChildIndex (playerScoreText) < numChildren - 1) { setChildIndex (playerScoreText, numChildren - 1);}
			 playerScoreText.text = ("" + player1Score);
			 
			 playerScoreText.setTextFormat(myFormat);
			
			
			 if (getChildIndex (aiScoreText) < numChildren - 1) { setChildIndex (aiScoreText, numChildren - 1);}
			 aiScoreText.text = ("" + player2Score);
			 aiScoreText.setTextFormat(myFormat);
			 
			 if (player1Score == 10 || player2Score == 10)
			 {
				end = true;
				player1Score = 0;
				player2Score = 0;			 }
			 
		}
		
	}

}
