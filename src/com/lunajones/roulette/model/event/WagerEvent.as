package com.lunajones.roulette.model.event
{
	import flash.events.Event;
	
	public class WagerEvent extends Event
	{
		public static const CHANGE:String ="change";
		
		public function WagerEvent(type:String)
		{
			super(type, bubbles, cancelable);
		}
	}
}