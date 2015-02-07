package com.lunajones.roulette.model
{
	import com.lunajones.roulette.model.event.GameEvent;
	
	import org.robotlegs.mvcs.Actor;
	
	public class GameModel extends Actor
	{
		private var _amount:int = 35000;
		private var _wager:int = 0;//下注的總金額
		private var _chooseChip:int = 0;//選擇的籌碼(只能選一種)
		private var _chooseBetZone:String = ""//滑鼠選擇的區域
		private var _wagerHistory:Array = [];//投注記錄
		private var _result:int = -1;
		private var _resultHistory:Array = [];
		
		public function GameModel()
		{
			super();
		}
		
		public function addWager():void{//新增投注記錄
			if(_chooseBetZone != ""){
				_amount -= _chooseChip;
				_wager += _chooseChip;
				_wagerHistory.push({bet:_chooseBetZone,num:_chooseChip});
				dispatch(new GameEvent(GameEvent.CHANGE));
			}
		}
		
		public function doubleWager():void{
			_wager*=2;
			dispatch(new GameEvent(GameEvent.CHANGE));
		}
		
		public function clearWager():void{//清除全部投注記錄
			_wager = 0;
			_wagerHistory =[];
			_chooseChip = 0;
			dispatch(new GameEvent(GameEvent.CHANGE));
		}
		
		public function parentWager():void{//上一次投注記錄
			_wager -= _chooseChip;
			_wagerHistory.pop();
			trace(_wagerHistory)
			dispatch(new GameEvent(GameEvent.CHANGE));
		}
		
		public function set amount(num:int):void{
			_amount = num;
		}
		public function get amount():int{
			return _amount;
		}
		
		public function set wager(num:int):void{
			_wager = num;
		}
		public function get wager():int{
			return _wager;
		}
		
		public function set chooseChip(num:int):void{
			_chooseChip = num;
		}
		public function get chooseChip():int{
			return _chooseChip;
		}
		
		public function set chooseBetZone(zone:String):void{
			_chooseBetZone = zone;
		}
		public function get chooseBetZone():String{
			return _chooseBetZone;
		}
		
		public function get wagerHistory():Array{
			return _wagerHistory;
		}
		
		public function set result(num:int):void{
			
			_result = num;
			_resultHistory.push(num);
			dispatch(new GameEvent(GameEvent.GET_RESULT));
		}
		
		public function get result():int{
			return _result;
		}
		
		public function get resultHistory():Array{
			return _resultHistory;
		}
		
		
		
	}
}