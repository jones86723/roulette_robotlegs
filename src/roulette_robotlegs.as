package
{
	import com.lunajones.roulette.RouletteContext;
	
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	public class roulette_robotlegs extends Sprite
	{
		
		[Embed(source="../source/bg.jpg")]
		private var Bg: Class;
		
		private var _context:RouletteContext;
		
		//[SWF(width="1024", height="768", background-color="#000000", frameRate="30")]
		public function roulette_robotlegs()
		{
			super();
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			var bg:Bitmap = new Bg() as Bitmap;
			
			this.addChild(bg);
			_context = new RouletteContext(this);
		}
	}
}