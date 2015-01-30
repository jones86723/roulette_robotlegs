package com.lunajones.roulette.view
{
	import org.robotlegs.mvcs.Mediator;
	import com.lunajones.roulette.view.ButtonsView;
	
	public class ButtonsViewMediator extends Mediator
	{
		[Inject]
		public var view:ButtonsView;
		
		public function ButtonsViewMediator()
		{
			super();
		}
		
		override public function onRegister():void{
			view.main();
		}
	}
}