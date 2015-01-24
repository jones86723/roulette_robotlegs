package com.lunajones.roulette.view
{
	import org.robotlegs.mvcs.Mediator;
	import com.lunajones.roulette.view.BetView;
	
	public class BetViewMediator extends Mediator
	{
		[Inject]
		public var view:BetView;
		
		public function BetViewMediator()
		{
			super();
		}
		
		override public function onRegister():void{
			view.main();
		}
	}
}