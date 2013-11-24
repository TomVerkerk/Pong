package  
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	/**
	 * ...
	 * @author Tom Verkerk
	 */
	public class Buttons 
	{
		[Embed(source="../lib/sfx_buttons.mp3")]
		public static var button:Class;
		public static var ButtonSound:SoundChannel;
		private var volume:SoundTransform = new SoundTransform(1, 0);
		
		public function Buttons() 
		{
			ButtonSound = (new button() as Sound).play(0, 0, volume);
		}
		
	}

}