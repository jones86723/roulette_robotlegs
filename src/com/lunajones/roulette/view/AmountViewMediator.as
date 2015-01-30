package com.lunajones.roulette.view
{
	import org.robotlegs.mvcs.Mediator;
	import com.lunajones.roulette.view.AmountView;
	
	public class AmountViewMediator extends Mediator
	{
		[Inject]
		public var view:AmountView;
		
		public function AmountViewMediator()
		{
			super();
		}
		
		override public function onRegister():void{
			view.main();
		}
	}
}