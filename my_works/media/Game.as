package { 
	
	import flash.display.Sprite;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Timer;
    import flash.events.TimerEvent;
	
	import flash.display.MovieClip; 
	import flash.events.MouseEvent;
	import flash.events.*; 
	import flash.display.*; 
	import flash.events.*; 
	import flash.media.*;
	import flash.text.*;
	import fl.motion.MotionEvent;
	
	public class Game extends flash.display.MovieClip{
				  
		public var xml:XML;
		public var dataLoader:URLLoader = new URLLoader();
		
		public var clo_count:int = 1;
		//record the chosen song
		public var snd_num:String = "s";
		//arrange array to store xml data
		public var aa = new Array();
		public var bb = new Array();
		public var tt = new Array();
		
		public var cm:MovieClip;
		public var bg:MovieClip;
		public var channel:SoundChannel;
		public var mn:MovieClip = new menu();	
		public var ret:MovieClip = new button_return();	
		public var lr:MovieClip = new lightr();
		public var lw:MovieClip = new lightw();
		public var lg:MovieClip = new lightg();
		public var snd:Sound;
		

		public function Game()
		{
			mn.x = 0;
			mn.y = 0;
			addChild(mn);
			
			mn.bs.addEventListener("click", show_still);
			mn.bm.addEventListener("click", show_monster);
			mn.be.addEventListener("click", show_endless);
			mn.ba.addEventListener("click", show_arashi);
			mn.bsc1.addEventListener("click", startc1_still);
			mn.bsc2.addEventListener("click", startc2_still);
			mn.bmc1.addEventListener("click", startc1_monster);
			mn.bmc2.addEventListener("click", startc2_monster);
			mn.bec1.addEventListener("click", startc1_endless);
			mn.bec2.addEventListener("click", startc2_endless);
			mn.bac1.addEventListener("click", startc1_arashi);
			mn.bac2.addEventListener("click", startc2_arashi);
			mn.cloth1.addEventListener("click", change_cloth);
			mn.cloth2.addEventListener("click", change_cloth);
						
			ret.addEventListener("click", return_menu);
			
			mn.bmc1.visible = false;
			mn.bmc2.visible = false;
			mn.bec1.visible = false;
			mn.bec2.visible = false;
			mn.bac1.visible = false;
			mn.bac2.visible = false;
			mn.bsc2.visible = false;
			mn.cloth1.visible = true;
			mn.cloth2.visible = false;			
			
		}
		
		public function change_stage()
		{
			ret.visible = true;
			
			bg.x = 0;
			bg.y = 0;
			addChild(bg);
			cm.x = 0;
			cm.y = 0;
			addChild(cm);
			ret.x = 0;
			ret.y= 0;
			addChild(ret);
			//still at the beginning
			cm.gotoAndStop(1)
			mn.visible = false;
			
			lw.x = 40;
			lw.y = -140;
			addChild(lw);
			lr.x = 56;
			lr.y = 0;
			addChild(lr);
			lg.x = 0;
			lg.y =44;
			addChild(lg);
			
			lr.visible = false;
			lw.visible = false;
			lg.visible = false;
		}
		
		public function show_still(me:MouseEvent)
		{	
			snd_num = "s";
			
			if( clo_count % 2 == 1)
			{
				mn.bsc1.visible = true;
				mn.bsc2.visible = false;
			}
			else
			{
				mn.bsc1.visible = false;
				mn.bsc2.visible = true;
			}
			mn.bmc1.visible = false;
			mn.bmc2.visible = false;
			mn.bec1.visible = false;
			mn.bec2.visible = false;
			mn.bac1.visible = false;
			mn.bac2.visible = false;
		}
		
		public function show_endless(me:MouseEvent)
		{	
			snd_num = "e";
			
			if( clo_count % 2 == 1)
			{
				mn.bec1.visible = true;
				mn.bec2.visible = false;
			}
			else
			{
				mn.bec1.visible = false;
				mn.bec2.visible = true;
			}
			mn.bmc1.visible = false;
			mn.bmc2.visible = false;
			mn.bsc1.visible = false;
			mn.bsc2.visible = false;
			mn.bac1.visible = false;
			mn.bac2.visible = false;
		}
		
		public function show_arashi(me:MouseEvent)
		{	
			snd_num = "a";
			
			if( clo_count % 2 == 1)
			{
				mn.bac1.visible = true;
				mn.bac2.visible = false;
			}
			else
			{
				mn.bac1.visible = false;
				mn.bac2.visible = true;
			}
			mn.bmc1.visible = false;
			mn.bmc2.visible = false;
			mn.bec1.visible = false;
			mn.bec2.visible = false;
			mn.bsc1.visible = false;
			mn.bsc2.visible = false;
		}
		
		public function show_monster(me:MouseEvent)
		{	
			snd_num = "m";
			
			if( clo_count % 2 == 1)
			{
				mn.bmc1.visible = true;
				mn.bmc2.visible = false;
			}
			else
			{
				mn.bmc1.visible = false;
				mn.bmc2.visible = true;
			}
			mn.bsc1.visible = false;
			mn.bsc2.visible = false;
			mn.bec1.visible = false;
			mn.bec2.visible = false;
			mn.bac1.visible = false;
			mn.bac2.visible = false;
		}
		
		public function change_cloth(me:MouseEvent)
		{
			clo_count++;
			
			if( clo_count % 2 == 1)
			{
				mn.cloth1.visible = true;
				mn.cloth2.visible = false;
				
				switch(snd_num){
					case "e":		
						mn.bec1.visible = true;
						mn.bec2.visible = false;
						break;
					case "m":
						mn.bmc1.visible = true;
						mn.bmc2.visible = false;
						break;
					case "s":
						mn.bsc1.visible = true;
						mn.bsc2.visible = false;
						break;
					case "a":
						mn.bac1.visible = true;
						mn.bac2.visible = false;
						break;
				}
			}
			else
			{
				mn.cloth1.visible = false;
				mn.cloth2.visible = true;
				
				switch(snd_num){
					case "e":		
						mn.bec2.visible = true;
						mn.bec1.visible = false;
						break;
					case "m":
						mn.bmc2.visible = true;
						mn.bmc1.visible = false;
						break;
					case "s":
						mn.bsc2.visible = true;
						mn.bsc1.visible = false;
						break;
					case "a":
						mn.bac2.visible = true;
						mn.bac1.visible = false;
						break;
				}
			}
		}
		
		public function startc1_still(me:MouseEvent)
		{	
			cm = new c1m1();
			snd = new Still();
			bg = new bgs();
			
			change_stage();
			
			dataLoader.load(new URLRequest("still.xml"));			
			dataLoader.addEventListener(Event.COMPLETE,dataLoaded);			
		}

		public function startc2_still(me:MouseEvent)
		{	
			cm = new c2m1();
			snd = new Still();
			bg = new bgs();
			
			change_stage();
			
			dataLoader.load(new URLRequest("still.xml"));			
			dataLoader.addEventListener(Event.COMPLETE,dataLoaded);
		}
		
		public function startc1_monster(me:MouseEvent)
		{
			cm = new c1m1();
			snd = new Monster();
			bg = new bgm();
			
			change_stage();	
			
			dataLoader.load(new URLRequest("monster.xml"));
			dataLoader.addEventListener(Event.COMPLETE,dataLoaded);			
		}

		public function startc2_monster(me:MouseEvent)
		{	
			cm = new c2m1();
			snd = new Monster();
			bg = new bgm();
			
			change_stage();
				
			dataLoader.load(new URLRequest("monster.xml"));
			dataLoader.addEventListener(Event.COMPLETE,dataLoaded);
		}
		
		public function startc1_endless(me:MouseEvent)
		{	
			cm = new c1m1();
			snd = new Endless();
			bg = new bge();
			
			change_stage();
			
			dataLoader.load(new URLRequest("endless.xml"));
			dataLoader.addEventListener(Event.COMPLETE,dataLoaded);
		}

		public function startc2_endless(me:MouseEvent)
		{			
			cm = new c2m1();
			snd = new Endless();
			bg = new bge();
			
			change_stage();
				
			dataLoader.load(new URLRequest("endless.xml"));
			dataLoader.addEventListener(Event.COMPLETE,dataLoaded);
		}
		
		public function startc1_arashi(me:MouseEvent)
		{			
			cm = new c1m1();
			snd = new arashi();
			bg = new bga();
			
			change_stage();
				
			dataLoader.load(new URLRequest("arashi.xml"));
			dataLoader.addEventListener(Event.COMPLETE,dataLoaded);
		}

		public function startc2_arashi(me:MouseEvent)
		{			
			cm = new c2m1();
			snd = new arashi();
			bg = new bga();
			
			change_stage();
				
			dataLoader.load(new URLRequest("arashi.xml"));
			dataLoader.addEventListener(Event.COMPLETE,dataLoaded);
		}
		
		function dataLoaded(event:Event):void
		{
			xml=XML(event.target.data);

			//switch the background
			bg.play();	
			//play the music
			channel = snd.play();

			//get xml data
			for(var i=0; i<xml.children().length(); i++)
			{
				aa[i] = xml.tempo[i].time;
				bb[i] = xml.tempo[i].sound;
				
				var myTimer:Timer= new Timer(Number(aa[i]),1);
				tt[i] = myTimer;
				tt[i].start();	
				
				switch(i%7){
					case 0:
						if(bb[i]<0.34)
							tt[i].addEventListener(TimerEvent.TIMER, move20);
						else if(bb[i]<0.40)
							tt[i].addEventListener(TimerEvent.TIMER, move21);
						else if(bb[i]<0.48)
							tt[i].addEventListener(TimerEvent.TIMER, move22);
						else
							tt[i].addEventListener(TimerEvent.TIMER, move23);
						break;
					case 1:
						if(bb[i]<0.34)
							tt[i].addEventListener(TimerEvent.TIMER, move30);
						else if(bb[i]<0.40)
							tt[i].addEventListener(TimerEvent.TIMER, move31);
						else if(bb[i]<0.48)
							tt[i].addEventListener(TimerEvent.TIMER, move32);
						else
							tt[i].addEventListener(TimerEvent.TIMER, move33);
						break;
					case 2:
						if(bb[i]<0.34)
							tt[i].addEventListener(TimerEvent.TIMER, move40);
						else if(bb[i]<0.4)
							tt[i].addEventListener(TimerEvent.TIMER, move41);
						else if(bb[i]<0.48)
							tt[i].addEventListener(TimerEvent.TIMER, move42);
						else
							tt[i].addEventListener(TimerEvent.TIMER, move43);
						break;
					case 3:
						if(bb[i]<0.34)
							tt[i].addEventListener(TimerEvent.TIMER, move50);
						else if(bb[i]<0.4)
							tt[i].addEventListener(TimerEvent.TIMER, move51);
						else if(bb[i]<0.48)
							tt[i].addEventListener(TimerEvent.TIMER, move52);
						else
							tt[i].addEventListener(TimerEvent.TIMER, move53);
						break;
					case 4:
						if(bb[i]<0.34){
							if(i%14 == 4)
								tt[i].addEventListener(TimerEvent.TIMER, move60);
							else
								tt[i].addEventListener(TimerEvent.TIMER, move90);
						}					
						else if(bb[i]<0.4){
							if(i%14 == 4)
								tt[i].addEventListener(TimerEvent.TIMER, move61);
							else
								tt[i].addEventListener(TimerEvent.TIMER, move91);
						}
						else if(bb[i]<0.48){
							if(i%14 == 4)
								tt[i].addEventListener(TimerEvent.TIMER, move62);
							else
								tt[i].addEventListener(TimerEvent.TIMER, move92);
						}
						else{
							if(i%14 == 4)
								tt[i].addEventListener(TimerEvent.TIMER, move63);
							else
								tt[i].addEventListener(TimerEvent.TIMER, move93);
						}
						break;
					case 5:
						if(bb[i]<0.34){
							if(i%14 == 5)
								tt[i].addEventListener(TimerEvent.TIMER, move80);
							else
								tt[i].addEventListener(TimerEvent.TIMER, move100);
						}					
						else if(bb[i]<0.4){
							if(i%14 == 5)
								tt[i].addEventListener(TimerEvent.TIMER, move81);
							else
								tt[i].addEventListener(TimerEvent.TIMER, move101);
						}
						else if(bb[i]<0.48){
							if(i%14 == 5)
								tt[i].addEventListener(TimerEvent.TIMER, move82);
							else
								tt[i].addEventListener(TimerEvent.TIMER, move102);
						}
						else{
							if(i%14 == 5)
								tt[i].addEventListener(TimerEvent.TIMER, move83);
							else
								tt[i].addEventListener(TimerEvent.TIMER, move103);
						}
						break;
					case 6:
						if(bb[i]<0.34){
							if(i%14 == 6)
								tt[i].addEventListener(TimerEvent.TIMER, move80);
							else
								tt[i].addEventListener(TimerEvent.TIMER, move120);
						}					
						else if(bb[i]<0.4){
							if(i%14 == 6)
								tt[i].addEventListener(TimerEvent.TIMER, move81);
							else
								tt[i].addEventListener(TimerEvent.TIMER, move121);
						}
						else if(bb[i]<0.48){
							if(i%14 == 6)
								tt[i].addEventListener(TimerEvent.TIMER, move82);
							else
								tt[i].addEventListener(TimerEvent.TIMER, move122);
						}
						else{
							if(i%14 == 6)
								tt[i].addEventListener(TimerEvent.TIMER, move83);
							else
								tt[i].addEventListener(TimerEvent.TIMER, move123);
						}
						break;
					/*case 7:
						tt[i].addEventListener(TimerEvent.TIMER, move8);
						break;
					case 18:
						tt[i].addEventListener(TimerEvent.TIMER, move13);
						break;
					case 19:
						tt[i].addEventListener(TimerEvent.TIMER, move14);
						break;
						*/
				}
				
			}
		}
		
		function return_menu(me:MouseEvent)
		{
			channel.stop();
			
			clo_count = 1;
			snd_num = "s";
			
			while (tt.length)  
            { 
                tt.pop();  
            } 
			while (aa.length)  
            {  
                aa.pop();  
            } 
			while (bb.length)  
            {  
                bb.pop();  
            } 
			
			trace(tt.length);
			trace(aa.length);
			trace(bb.length);
			mn.visible = true;
			bg.visible = false;
			cm.visible = false;
			lr.visible = false;
			lw.visible = false;
			lg.visible = false;		
			
		}
		
		function light0()
		{
			lr.visible = false;
			lw.visible = false;
			lg.visible = false;
		}
		function light1()
		{
			lr.visible = false;
			lw.visible = false;
			lg.visible = false;
			lg.visible = true;	
		}
		function light2()
		{
			lr.visible = false;
			lw.visible = false;
			lg.visible = false;
			lg.visible = true;
			lr.visible = true;	
		}
		function light3()
		{	
			lr.visible = false;
			lw.visible = false;
			lg.visible = false;
			lg.visible = true;
			lr.visible = true;
			lw.visible = true;	
		}
		function move10(e:TimerEvent)
		{
			light0();
			cm.gotoAndStop(1);
		}
		function move11(e:TimerEvent)
		{
			light1();
			cm.gotoAndStop(1);
		}
		function move12(e:TimerEvent)
		{
			light2();
			cm.gotoAndStop(1);
		}
		function move13(e:TimerEvent)
		{
			light3();
			cm.gotoAndStop(1);
		}
		function move20(e:TimerEvent)
		{
			light0();
			cm.gotoAndStop(2);
		}
		function move21(e:TimerEvent)
		{
			light1();
			cm.gotoAndStop(2);
		}
		function move22(e:TimerEvent)
		{
			light2();
			cm.gotoAndStop(2);
		}
		function move23(e:TimerEvent)
		{
			light3();
			cm.gotoAndStop(2);
		}
		function move30(e:TimerEvent)
		{
			light0();
			cm.gotoAndStop(3);
		}
		function move31(e:TimerEvent)
		{
			light1();
			cm.gotoAndStop(3);
		}
		function move32(e:TimerEvent)
		{
			light2();
			cm.gotoAndStop(3);
		}
		function move33(e:TimerEvent)
		{
			light3();
			cm.gotoAndStop(3);
		}
		function move40(e:TimerEvent)
		{
			light0();
			cm.gotoAndStop(4);
		}
		function move41(e:TimerEvent)
		{
			light1();
			cm.gotoAndStop(4);
		}
		function move42(e:TimerEvent)
		{
			light2();
			cm.gotoAndStop(4);
		}
		function move43(e:TimerEvent)
		{
			light3();
			cm.gotoAndStop(4);
		}
		function move50(e:TimerEvent)
		{
			light0();
			cm.gotoAndStop(5);
		}
		function move51(e:TimerEvent)
		{
			light1();
			cm.gotoAndStop(5);
		}
		function move52(e:TimerEvent)
		{
			light2();
			cm.gotoAndStop(5);
		}
		function move53(e:TimerEvent)
		{
			light3();
			cm.gotoAndStop(5);
		}
		function move60(e:TimerEvent)
		{
			light0();
			cm.gotoAndStop(6);
		}
		function move61(e:TimerEvent)
		{
			light1();
			cm.gotoAndStop(6);
		}
		function move62(e:TimerEvent)
		{
			light2();
			cm.gotoAndStop(6);
		}
		function move63(e:TimerEvent)
		{
			light3();
			cm.gotoAndStop(6);
		}
		function move70(e:TimerEvent)
		{
			light0();
			cm.gotoAndStop(7);
		}
		function move71(e:TimerEvent)
		{
			light1();
			cm.gotoAndStop(7);
		}
		function move72(e:TimerEvent)
		{
			light2();
			cm.gotoAndStop(7);
		}
		function move73(e:TimerEvent)
		{
			light3();
			cm.gotoAndStop(7);
		}
		function move80(e:TimerEvent)
		{
			light0();
			cm.gotoAndStop(8);
		}
		function move81(e:TimerEvent)
		{
			light1();
			cm.gotoAndStop(8);
		}
		function move82(e:TimerEvent)
		{
			light2();
			cm.gotoAndStop(8);
		}
		function move83(e:TimerEvent)
		{
			light3();
			cm.gotoAndStop(8);
		}
		function move90(e:TimerEvent)
		{
			light0();
			cm.gotoAndStop(9);
		}
		function move91(e:TimerEvent)
		{
			light1();
			cm.gotoAndStop(9);
		}
		function move92(e:TimerEvent)
		{
			light2();
			cm.gotoAndStop(9);
		}
		function move93(e:TimerEvent)
		{
			light3();
			cm.gotoAndStop(9);
		}
		function move100(e:TimerEvent)
		{
			light0();
			cm.gotoAndStop(10);
		}
		function move101(e:TimerEvent)
		{
			light1();
			cm.gotoAndStop(10);
		}
		function move102(e:TimerEvent)
		{
			light2();
			cm.gotoAndStop(10);
		}
		function move103(e:TimerEvent)
		{
			light3();
			cm.gotoAndStop(10);
		}
		function move120(e:TimerEvent)
		{
			light0();
			cm.gotoAndStop(12);
		}
		function move121(e:TimerEvent)
		{
			light1();
			cm.gotoAndStop(12);
		}
		function move122(e:TimerEvent)
		{
			light2();
			cm.gotoAndStop(12);
		}
		function move123(e:TimerEvent)
		{
			light3();
			cm.gotoAndStop(12);
		}
	}
}
		