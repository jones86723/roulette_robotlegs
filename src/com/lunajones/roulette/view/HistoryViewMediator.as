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
			var ary:Array = [];
			if(model.resultHistory.length<7){
				ary = model.resultHistory.concat().reverse();
			}else{
				ary = model.resultHistory.concat().slice(model.resultHistory.length-7,model.resultHistory.length+1).reverse();
			}
			trace(model.resultHistory);
			trace(ary);
			for(var i:int = 0 ; i<7 ; i++){
				//trace(i<model.resultHistory.length);
				if(i < ary.length){
					var num:int = ary[i];
					//trace(view.txts["r"+i].text);
					if(NumberUtils.getColor(num) == "red"){
						view.txts["r"+i].text = String(num);
						view.txts["b"+i].text = "";
					}else if(NumberUtils.getColor(num) == "black"){
						view.txts["b"+i].text = String(num);
						view.txts["r"+i].text = "";
					}else{
						view.txts["b"+i].text = String(num);
						view.txts["r"+i].text = "";
					}
				}else{
					view.txts["r"+i].text = "";
					view.txts["b"+i].text = "";
				}
			}		
		} 
	}
}