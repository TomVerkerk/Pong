package  
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	/**
	 * ...
	 * @author Tom Verkerk
	 */
	public class Background 
	{
		[Embed(source="../lib/sfx_background.mp3")]
		public static var bg:Class;
		public static var bgSound:SoundChannel;
		private var volume:SoundTransform = new SoundTransform(1, 0);
		
		public function Background() 
		{
			bgSound = (new bg() as Sound).play(0, int.MAX_VALUE, volume);
		}
		
	}

}