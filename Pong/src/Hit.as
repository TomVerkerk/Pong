package  
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	/**
	 * ...
	 * @author Tom Verkerk
	 */
	public class Hit 
	{
		[Embed(source="../lib/sfx_hit.mp3")]
		public static var hit:Class;
		public static var hitSound:SoundChannel;
		private var volume:SoundTransform = new SoundTransform(1, 0);
		
		public function Hit() 
		{
			hitSound = (new hit() as Sound).play(0, 0, volume);
		}
		
	}

}