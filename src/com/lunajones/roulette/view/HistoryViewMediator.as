package com.lunajones.roulette.view
{
	import org.robotlegs.mvcs.Mediator;
	import com.lunajones.roulette.view.HistoryView;
	
	public class HistoryViewMediator extends Mediator
	{
		[Inject]
		public var view:HistoryView;
		
		public function HistoryViewMediator()
		{
			super();
		}
		
		override public function onRegister():void{
			view.main();
		}
	}
}