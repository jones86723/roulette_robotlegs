package
{
	import flash.display.Sprite;
	import com.lunajones.roulette.RouletteContext;
	public class roulette_robotlegs extends Sprite
	{
		private var _context:RouletteContext;
		public function roulette_robotlegs()
		{
			super();
			_context = new RouletteContext(this);
		}
	}
}