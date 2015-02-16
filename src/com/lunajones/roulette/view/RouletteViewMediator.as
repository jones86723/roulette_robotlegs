package com.lunajones.roulette.view
{
	
	import com.greensock.TweenLite;
	import com.lunajones.roulette.model.GameModel;
	import com.lunajones.roulette.model.event.GameEvent;
	import com.lunajones.roulette.view.RouletteView;
	import com.lunajones.roulette.view.event.RouletteEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	
	
	public class RouletteViewMediator extends Mediator
	{
		[Inject]
		public var view:RouletteView;
		
		[Inject]
		public var model:GameModel;
		
		public function RouletteViewMediator()
		{
			super();
		}
		
		override public function onRegister():void{
			view.main();
			eventMap.mapListener(eventDispatcher,RouletteEvent.START_RUN,onstartrun);
			eventMap.mapListener(view,RouletteEvent.FINISH_RUN,onfinishrun);
			eventMap.mapListener(eventDispatcher,GameEvent.GET_RESULT,ongetresult);
		}

		private function onstartrun(e:RouletteEvent):void{
			view.runNumber();
		}
		
				
		private function ongetresult(e:GameEvent):void{
			
		}
		
		private function onfinishrun(e:RouletteEvent):void{
			model.result = e.data as Number;
			trace("model.result="+model.result)
		}
		
		private function randomRange(min:Number, max:Number):Number {
			var randomNum:Number = Math.floor(Math.random()*(max-min+1))+min;
			return randomNum;
		}
	}
}