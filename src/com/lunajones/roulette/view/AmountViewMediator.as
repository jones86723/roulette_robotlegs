package com.lunajones.roulette.view
{
	import com.lunajones.roulette.model.GameModel;
	import com.lunajones.roulette.model.event.GameEvent;
	import com.lunajones.roulette.view.AmountView;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class AmountViewMediator extends Mediator
	{
		[Inject]
		public var view:AmountView;
		
		[Inject] 
		public var model:GameModel;
		
		public function AmountViewMediator()
		{
			super();
		}
		
		override public function onRegister():void{
			view.main();
			eventMap.mapListener(eventDispatcher,GameEvent.CHANGE,onchange);
		}
		
		private function onchange(e:GameEvent):void{
			view.txt.text = String(model.amount);
		}
	}
}