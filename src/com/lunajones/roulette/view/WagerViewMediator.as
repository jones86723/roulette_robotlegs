package com.lunajones.roulette.view
{
	import com.lunajones.roulette.model.GameModel;
	import com.lunajones.roulette.model.event.GameEvent;
	import com.lunajones.roulette.view.WagerView;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class WagerViewMediator extends Mediator
	{
		[Inject]
		public var wagerView:WagerView;
		
		[Inject]
		public var gameModel:GameModel;
		
		
		public function WagerViewMediator()
		{
			
		}
		
		override public function onRegister():void{
			
			wagerView.main();
			eventMap.mapListener(eventDispatcher,GameEvent.CHANGE,onchange);
			
		}
		
		//當金額改變
		private function onchange(e:GameEvent):void{
		
			wagerView.txt.text = String(gameModel.wager);
			
		}
	}
}