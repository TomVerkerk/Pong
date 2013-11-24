package  
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	/**
	 * ...
	 * @author Tom Verkerk
	 */
	public class End 
	{
		[Embed(source="../lib/sfx_end.mp3")]
		public static var end:Class;
		public static var endSound:SoundChannel;
		private var volume:SoundTransform = new SoundTransform(1, 0);
		
		public function End() 
		{
			endSound = (new end() as Sound).play(0, 0, volume);
		}
		
	}

}