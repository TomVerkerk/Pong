package  
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	/**
	 * ...
	 * @author Tom Verkerk
	 */
	public class Intro 
	{
		[Embed(source="../lib/sfx_intro.mp3")]
		public static var intro:Class;
		public static var introSound:SoundChannel;
		private var volume:SoundTransform = new SoundTransform(1, 0);
		
		public function Intro() 
		{
			introSound = (new intro() as Sound).play(0, int.MAX_VALUE, volume);
		}
		
	}

}