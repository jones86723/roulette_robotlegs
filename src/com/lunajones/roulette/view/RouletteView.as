package com.lunajones.roulette.view
{
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
	import Box2D.Dynamics.*;
	import Box2D.Dynamics.Joints.*;
	
	import com.greensock.TweenLite;
	import com.lunajones.roulette.view.event.RouletteEvent;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	[Embed('../../../../source/roulette_asset.swf', symbol='Roulette')]
	public class RouletteView extends Sprite
	{
		
		public var ball:MovieClip;
		public var rouletteMc:MovieClip;
		
		private var world:b2World=new b2World(new b2Vec2(0,50),true);
		private var worldScale:Number=30;
		private var planetVector:Vector.<b2Body>=new Vector.<b2Body>();
		private var debrisVector:Vector.<b2Body>=new Vector.<b2Body>();
		//private var bVector:Vector.<b2Body>=new Vector.<b2Body>();
		//var orbitCanvas:Sprite=new Sprite();
		private var ctime:int = 0;
		private var linebody:b2Body;
		private var box:b2Body;
		private var speed:Number = 30;
		private var isTouch:int = -1;
		public function RouletteView()
		{
			super();
		}
		
		public function main():void{
			this.x = 227;
			this.y = -336;
			
			debugDraw();
			addBall();
			addPlanet(296,298,87);
			
			//addEventListener(Event.ENTER_FRAME,update);
			//stage.addEventListener(MouseEvent.CLICK,createDebris);
			
		}
		
		private function createDebris():void {
			addBall();
		}
		private function addPlanet(pX:Number,pY:Number,r:Number):void {
			for(var i:int=0;i<37;i++){
				var polygonShape:b2PolygonShape=new b2PolygonShape();
				polygonShape.SetAsBox(9/worldScale/2,30/worldScale/2);
				var fixtureDef:b2FixtureDef = new b2FixtureDef();
				fixtureDef.density=0;
				fixtureDef.friction=15;
				fixtureDef.restitution=0;//彈力
				fixtureDef.shape=polygonShape;
				var bodyDef:b2BodyDef = new b2BodyDef();
				//bodyDef.type=b2Body.b2_dynamicBody;
				bodyDef.position.Set(i*(1665)/worldScale/37,750/worldScale);
				var box:b2Body=world.CreateBody(bodyDef);
				box.SetBullet(false) ;
				planetVector.push(box);
				box.CreateFixture(fixtureDef);
			}
			var fixtureCircleDef:b2FixtureDef = new b2FixtureDef();
			var lineDef:b2PolygonShape = new b2PolygonShape();
			var vec1:b2Vec2 =new b2Vec2(0,400/worldScale);
			var vec2:b2Vec2 =new b2Vec2(1665/worldScale,400/worldScale);
			lineDef.SetAsEdge(vec1,vec2);
			fixtureCircleDef.shape = lineDef;
			fixtureCircleDef.friction=0;
			fixtureCircleDef.density=5;
			fixtureCircleDef.restitution=0;//彈力
			var bodyDef2:b2BodyDef=new b2BodyDef();
			linebody=world.CreateBody(bodyDef2);
			linebody.CreateFixture(fixtureCircleDef);
		}
		private function addBall():void {
			ctime = 0;
			var circleShape:b2CircleShape=new b2CircleShape(9/worldScale);
			//polygonShape.SetAsBox(w/worldScale/2,h/worldScale/2);
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			fixtureDef.density=0;
			fixtureDef.friction=0;
			fixtureDef.restitution=0.3;//彈力
			fixtureDef.shape=circleShape;
			var bodyDef:b2BodyDef = new b2BodyDef();
			bodyDef.type=b2Body.b2_dynamicBody;
			bodyDef.position.Set(500/worldScale,100/worldScale);
			box =world.CreateBody(bodyDef);
			box.SetBullet(false) ;
			debrisVector.push(box);
			box.CreateFixture(fixtureDef);	
			
		}
		private function debugDraw():void {
			var debugDraw:b2DebugDraw = new b2DebugDraw();
			var debugSprite:Sprite = new Sprite();
			addChild(debugSprite);
			debugDraw.SetSprite(debugSprite);
			debugDraw.SetDrawScale(worldScale);
			debugDraw.SetFlags(b2DebugDraw.e_shapeBit|b2DebugDraw.e_jointBit);
			debugDraw.SetFillAlpha(0.5);
			world.SetDebugDraw(debugDraw);
		}
		private function update(e:Event):void {
			world.Step(1/30, 50, 50);
			
			world.ClearForces();
			for (var i:int=0; i<debrisVector.length; i++) {//小球
				var p:b2Vec2= debrisVector[i].GetPosition();				 
				if(p.x>1665/worldScale){
					ctime++
					debrisVector[i].SetPosition(new b2Vec2(0,p.y))
				}else if(p.x<0){
					debrisVector[i].SetPosition(new b2Vec2(1665/worldScale,p.y))
				}
				
				if(ctime>4){
					linebody.SetPosition(new b2Vec2(0,350/worldScale))
					speed = speed-speed*0.0085;
					if(speed<1)speed=0;
				}else{
					speed = 30;
				}
				//speed = 30;
				rundebris();
				var r:Number = 110*(750-p.y*worldScale)/350;
				
				
				
				
				if(isTouch ==-1){
					for(var j:int=0;j<=36;j++){
						if(ball.hitTestObject(rouletteMc["hit"+j])){
							
							
							if(speed<12){
								var fx:b2Fixture = debrisVector[i].GetFixtureList();
								fx.SetDensity(5);
								isTouch = j;
							}
						}
					}
					ball.x = 295+(r+130)*Math.cos(-Math.PI*2*p.x*worldScale/1665 );
					ball.y = 298+(r+130)*Math.sin(-Math.PI*2*p.x*worldScale/1665 );
				}else{
					var pt:Point = rouletteMc.localToGlobal(new Point(rouletteMc["hit"+isTouch].x, rouletteMc["hit"+isTouch].y));
					ball.x = pt.x-230;	
					ball.y = pt.y-100;	
				}
			}
			
			if(speed<=0){
				TweenLite.to(this,0.8,{y:-336});
				dispatchEvent(new RouletteEvent(RouletteEvent.FINISH_RUN,isTouch));
				removeEventListener(Event.ENTER_FRAME,update);
				
				
			}
			//world.DrawDebugData(); 
		}
		
		private function rundebris():void{
			for(var i:int=0;i<planetVector.length;i++){
				var n:Number= planetVector[i].GetPosition().x*worldScale;
				planetVector[i].SetPosition(new b2Vec2((n-speed)/worldScale,750/worldScale))
				if(planetVector[i].GetPosition().x<0){
					var s:int = i-1;
					if(s<0){
						s = planetVector.length-1
					}
					planetVector[i].SetPosition(new b2Vec2(planetVector[s].GetPosition().x+45/worldScale,750/worldScale));
					
				}	
			}
			rouletteMc.rotation+=360*speed/1665;
		}
		
		public function runNumber():void{
			addEventListener(Event.ENTER_FRAME,update);
			isTouch = -1;
			TweenLite.to(this,0.8,{y:100});
			ctime = 0;
			linebody.SetPosition(new b2Vec2(0,10/worldScale))
			box.SetPosition(new b2Vec2(Math.random()*20,400/worldScale))
			box.ApplyImpulse(new b2Vec2(12000*Math.random()*3000,0),box.GetWorldCenter());
		}
	}
}