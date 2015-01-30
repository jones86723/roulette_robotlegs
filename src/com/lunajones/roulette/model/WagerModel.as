package com.lunajones.roulette.model
{
	import com.lunajones.roulette.model.event.WagerEvent;
	
	import org.robotlegs.mvcs.Actor;
	
	//下注的金額
	public class WagerModel extends Actor
	{
		private var _money:int = 0;
		
		public function WagerModel()
		{
			super();
		}
		
		public function addmoney(num:int):void{
			_money+=num;
			dispatch(new WagerEvent(WagerEvent.CHANGE));
		}
		public function removemoney(num:int):void{
			_money-=num;
		}
		
		public function set money(num:int):void{
			_money = num;
		}
		
		public function get money():int{
			return _money;
		}
	}
}