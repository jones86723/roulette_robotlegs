package com.lunajones.roulette.view
{
	
	import com.lunajones.roulette.view.RouletteView;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class RouletteViewMediator extends Mediator
	{
		[Inject]
		public var view:RouletteView;
		
		
		
		public function RouletteViewMediator()
		{
			super();
		}
		
		override public function onRegister():void{
			view.main();
			
		}
	}
}