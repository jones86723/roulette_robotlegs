package com.lunajones.roulette.model
{
	import com.lunajones.roulette.NumberUtils;
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
		private var _lastChooseChip:int =0;
		private var _lastWagerHistory:Array = [];
		private var _resultHistory:Array = [];
		private var _winMoney:int=0;
		
		public function GameModel()
		{
			super();
		}
		
		public function addWager():void{//新增投注記錄
			if(_chooseBetZone != ""){
				_amount -= _chooseChip;
				_wager += _chooseChip;
				if(_wagerHistory.length==0){
					dispatch(new GameEvent(GameEvent.CHOOSE_FIRST_CHIP));
				}
				_wagerHistory.push({bet:_chooseBetZone,num:_chooseChip,total:1});
				dispatch(new GameEvent(GameEvent.CHANGE));
			}
		}
		
		public function againWager():void{
			_amount -= _lastWagerHistory.length * _lastChooseChip;
			_wager += _lastWagerHistory.length * _lastChooseChip;
			_chooseChip = _lastChooseChip;
			_wagerHistory = _lastWagerHistory.concat();
			dispatch(new GameEvent(GameEvent.CHOOSE_FIRST_CHIP));
			dispatch(new GameEvent(GameEvent.CHANGE));
		}
		
		public function doubleWager():void{
			_wager*=2;
			_wagerHistory = _wagerHistory.concat(_wagerHistory);
			dispatch(new GameEvent(GameEvent.CHANGE));
		}
		
		public function clearWager():void{//清除全部投注記錄
			_wager = 0;
			_wagerHistory =[];
			_chooseChip = 0;
			dispatch(new GameEvent(GameEvent.CHANGE));
			if(_wagerHistory.length==0){
				dispatch(new GameEvent(GameEvent.CLEAR_ALL));
			}
		}
		
		public function parentWager():void{//上一次投注記錄
			_wager -= _chooseChip;
			_wagerHistory.pop();
			//trace(_wagerHistory)
			dispatch(new GameEvent(GameEvent.CHANGE));
			if(_wagerHistory.length==0){
				dispatch(new GameEvent(GameEvent.CLEAR_ALL));
			}
		}
		
		public function get rwargerHistory():Array{
			var ary:Array =new Array();
			for(var i:int = 0; i<_wagerHistory.length;i++){
				var o:Boolean = false;
				for(var j:int=0;j<ary.length;j++){
					if(ary[j].bet == _wagerHistory[i].bet){
						ary[j].total+=1;
						o = true;
					}
				}
				if(o == false){
					var obj:Object = new Object();
					obj.bet = _wagerHistory[i].bet;
					obj.chip = _wagerHistory[i].chip;
					obj.total = _wagerHistory[i].total;
					ary.push(obj);
				};
			}
			return ary;
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
			_lastChooseChip = _chooseChip;
			_lastWagerHistory=_wagerHistory.concat();
			_winMoney = 0;
			for(var i:int=0;i<_wagerHistory.length;i++){
				var ch:String =_wagerHistory[i].bet;
				_winMoney+=NumberUtils.getWin(_result,ch)*_chooseChip;
			}
			trace(_winMoney);
			_amount+=_winMoney;
			clearWager();
			//trace("rate="+NumberUtils.getWin(_result,"n0"));
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