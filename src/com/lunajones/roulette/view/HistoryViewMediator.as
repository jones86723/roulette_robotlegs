package com.lunajones.roulette.view
{
	import com.lunajones.roulette.NumberUtils;
	import com.lunajones.roulette.model.GameModel;
	import com.lunajones.roulette.model.event.GameEvent;
	import com.lunajones.roulette.view.HistoryView;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class HistoryViewMediator extends Mediator
	{
		[Inject]
		public var view:HistoryView;
		
		[Inject]
		public var model:GameModel;
		
		public function HistoryViewMediator()
		{
			super();
		}
		
		override public function onRegister():void{
			view.main();
			eventMap.mapListener(eventDispatcher,GameEvent.GET_RESULT,ongetresult);
		}
		
		private function ongetresult(e:GameEvent):void{
			for(var i:int = 0 ; i<7 ; i++){
				//trace(i<model.resultHistory.length);
				if(i < model.resultHistory.length){
					var num:int = model.resultHistory[i];
					//trace(view.txts["r"+i].text);
					if(NumberUtils.getColor(num) == "red"){
						view.txts["r"+i].text = String(num);
					}else if(NumberUtils.getColor(num) == "black"){
						view.txts["b"+i].text = String(num);
					}else{
						view.txts["b"+i].text = String(num);
					}
				}
			}		
		} 
	}
}