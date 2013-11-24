package  
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	/**
	 * ...
	 * @author Tom Verkerk
	 */
	public class Goal 
	{
		[Embed(source = "../lib/sfx_point.mp3")]
		public static var goal:Class;
		public static var goalSound:SoundChannel;
		private var volume:SoundTransform = new SoundTransform(1, 0);
		
		public function Goal() 
		{
			goalSound = (new goal() as Sound).play(0, 0, volume);
		}
		
	}

}