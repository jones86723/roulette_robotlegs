package com.lunajones.roulette.view
{
	import com.lunajones.roulette.model.WagerModel;
	import com.lunajones.roulette.model.event.WagerEvent;
	import com.lunajones.roulette.view.WagerView;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class WagerViewMediator extends Mediator
	{
		[Inject]
		public var wagerView:WagerView;
		
		[Inject]
		public var wagerModel:WagerModel;
		
		
		public function WagerViewMediator()
		{
			
		}
		
		override public function onRegister():void{
			wagerView.main();
			eventMap.mapListener(eventDispatcher,WagerEvent.CHANGE,onchange);
		}
		
		private function onchange(e:WagerEvent):void{
			trace(0);
			wagerView.txt.text = "28";
		}
	}
}