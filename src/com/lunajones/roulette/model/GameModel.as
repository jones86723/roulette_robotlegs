package com.lunajones.roulette.model
{
	import com.lunajones.roulette.model.event.GameEvent;
	
	import org.robotlegs.mvcs.Actor;
	
	//下注的金額
	public class GameModel extends Actor
	{
		private var _wager:int = 0;
		
		public function GameModel()
		{
			super();
		}
		
		public function addWager(num:int):void{
			_wager+=num;
			dispatch(new GameEvent(GameEvent.CHANGE));
		}
		public function removeWager(num:int):void{
			_wager-=num;
		}
		
		public function set wager(num:int):void{
			_wager = num;
		}
		
		public function get wager():int{
			return _wager;
		}
	}
}