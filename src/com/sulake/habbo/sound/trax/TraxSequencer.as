package com.sulake.habbo.sound.trax
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.sound.IHabboSound;
   import com.sulake.habbo.sound.events.SoundCompleteEvent;
   import flash.events.IEventDispatcher;
   import flash.events.SampleDataEvent;
   import flash.events.TimerEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   
   public class TraxSequencer implements IHabboSound
   {
      
      private static const const_114:Number = 44100;
      
      private static const const_183:uint = 8192;
      
      private static const const_1397:uint = 88000;
      
      private static const const_1398:uint = 88000;
      
      private static const const_286:Vector.<Number> = new Vector.<Number>(const_183,true);
       
      
      private var _events:IEventDispatcher;
      
      private var var_548:Number;
      
      private var var_1493:Sound;
      
      private var var_441:SoundChannel;
      
      private var var_1495:TraxData;
      
      private var var_1893:Map;
      
      private var var_1077:Boolean;
      
      private var var_1635:int;
      
      private var var_1496:int = 0;
      
      private var var_212:uint;
      
      private var var_980:Array;
      
      private var var_1892:Boolean;
      
      private var var_648:Boolean = true;
      
      private var var_365:uint;
      
      private var var_1494:uint;
      
      private var var_981:Boolean;
      
      private var var_788:Boolean;
      
      private var var_789:int;
      
      private var var_442:int;
      
      private var var_982:int;
      
      private var var_524:int;
      
      private var var_649:Timer;
      
      private var var_443:Timer;
      
      private var var_1218:int = 0;
      
      private var var_1894:int = 0;
      
      public function TraxSequencer(param1:int, param2:TraxData, param3:Map, param4:IEventDispatcher)
      {
         this.var_1494 = uint(30);
         super();
         this._events = param4;
         this.var_1635 = param1;
         this.var_548 = 1;
         this.var_1493 = new Sound();
         this.var_441 = null;
         this.var_1893 = param3;
         this.var_1495 = param2;
         this.var_1893 = param3;
         this.var_1077 = true;
         this.var_212 = 0;
         this.var_980 = [];
         this.var_1892 = false;
         this.var_365 = 0;
         this.var_648 = false;
         this.var_981 = false;
         this.var_788 = false;
         this.var_789 = 0;
         this.var_442 = 0;
         this.var_982 = 0;
         this.var_524 = 0;
      }
      
      public function set position(param1:Number) : void
      {
         this.var_212 = uint(param1 * const_114);
      }
      
      public function get volume() : Number
      {
         return this.var_548;
      }
      
      public function get position() : Number
      {
         return this.var_212 / const_114;
      }
      
      public function get ready() : Boolean
      {
         return this.var_1077;
      }
      
      public function set ready(param1:Boolean) : void
      {
         this.var_1077 = param1;
      }
      
      public function get finished() : Boolean
      {
         return this.var_648;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_442 / const_114;
      }
      
      public function set fadeOutSeconds(param1:Number) : void
      {
         this.var_442 = int(param1 * const_114);
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_789 / const_114;
      }
      
      public function set fadeInSeconds(param1:Number) : void
      {
         this.var_789 = int(param1 * const_114);
      }
      
      public function get traxData() : TraxData
      {
         return this.var_1495;
      }
      
      public function set volume(param1:Number) : void
      {
         this.var_548 = param1;
         if(this.var_441 != null)
         {
            this.var_441.soundTransform = new SoundTransform(this.var_548);
         }
      }
      
      public function get length() : Number
      {
         return this.var_365 / const_114;
      }
      
      public function prepare() : Boolean
      {
         if(!this.var_1077)
         {
            Logger.log("Cannot start trax playback until samples ready!");
            return false;
         }
         if(!this.var_1892)
         {
            if(!this.prepareSequence())
            {
               Logger.log("Cannot start playback, prepare sequence failed!");
               return false;
            }
         }
         return true;
      }
      
      private function prepareSequence() : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc1_:int = 0;
         while(_loc1_ < this.var_1495.channels.length)
         {
            _loc2_ = new Map();
            _loc3_ = this.var_1495.channels[_loc1_] as TraxChannel;
            _loc4_ = 0;
            _loc5_ = 0;
            _loc6_ = 0;
            while(_loc6_ < _loc3_.itemCount)
            {
               _loc7_ = _loc3_.getItem(_loc6_).id;
               _loc8_ = this.var_1893.getValue(_loc7_) as TraxSample;
               if(_loc8_ == null)
               {
                  Logger.log("Error in prepareSequence(), sample was null!");
               }
               continue;
               _loc9_ = this.getSampleBars(_loc8_.length);
               _loc10_ = _loc3_.getItem(_loc6_).length / _loc9_;
               _loc11_ = 0;
               while(_loc11_ < _loc10_)
               {
                  if(_loc7_ != 0)
                  {
                     _loc2_.add(_loc4_,_loc8_);
                  }
                  _loc5_ += _loc9_;
                  _loc4_ = uint(_loc5_ * const_1398);
                  _loc11_++;
               }
               if(this.var_365 < _loc4_)
               {
                  this.var_365 = _loc4_;
               }
               _loc6_++;
               return false;
            }
            this.var_980.push(_loc2_);
            _loc1_++;
         }
         this.var_1892 = true;
         return true;
      }
      
      public function play(param1:Number = 0.0) : Boolean
      {
         if(!this.prepare())
         {
            return false;
         }
         this.removeFadeoutStopTimer();
         if(this.var_441 != null)
         {
            this.stopImmediately();
         }
         if(this.var_789 > 0)
         {
            this.var_981 = true;
            this.var_982 = 0;
         }
         this.var_788 = false;
         this.var_524 = 0;
         this.var_648 = false;
         this.var_1493.addEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleData);
         this.var_1496 = param1 * const_114;
         this.var_1218 = 0;
         this.var_1894 = 0;
         this.var_441 = this.var_1493.play();
         return true;
      }
      
      public function render(param1:SampleDataEvent) : Boolean
      {
         if(!this.prepare())
         {
            return false;
         }
         while(!this.var_648)
         {
            this.onSampleData(param1);
         }
         return true;
      }
      
      public function stop() : Boolean
      {
         if(this.var_442 > 0 && !this.var_648)
         {
            this.stopWithFadeout();
         }
         else
         {
            this.playingComplete();
         }
         return true;
      }
      
      private function stopImmediately() : void
      {
         this.removeStopTimer();
         if(this.var_441 != null)
         {
            this.var_441.stop();
            this.var_441 = null;
         }
         this.var_1493.removeEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleData);
      }
      
      private function stopWithFadeout() : void
      {
         if(this.var_649 == null)
         {
            this.var_788 = true;
            this.var_524 = 0;
            this.var_649 = new Timer(this.var_1494 + this.var_442 / (const_114 / 1000),1);
            this.var_649.start();
            this.var_649.addEventListener(TimerEvent.TIMER_COMPLETE,this.onFadeOutComplete);
         }
      }
      
      private function getSampleBars(param1:uint) : int
      {
         return Math.ceil(param1 / const_1397);
      }
      
      private function getChannelSequenceOffsets() : Array
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc1_:* = [];
         var _loc2_:int = this.var_980.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this.var_980[_loc3_];
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length && _loc4_.getKey(_loc5_) < this.var_212)
            {
               _loc5_++;
            }
            _loc1_.push(_loc5_ - 1);
            _loc3_++;
         }
         return _loc1_;
      }
      
      private function mixChannelsIntoBuffer() : void
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc1_:Array = this.getChannelSequenceOffsets();
         var _loc2_:int = this.var_980.length;
         var _loc3_:* = null;
         var _loc4_:int = _loc2_ - 1;
         while(_loc4_ >= 0)
         {
            _loc5_ = this.var_980[_loc4_];
            _loc6_ = _loc1_[_loc4_];
            _loc7_ = _loc5_.getWithIndex(_loc6_);
            if(_loc7_ == null)
            {
               _loc3_ = null;
            }
            else
            {
               _loc10_ = _loc5_.getKey(_loc6_);
               _loc11_ = this.var_212 - _loc10_;
               if(_loc7_.id == 0 || _loc11_ < 0)
               {
                  _loc3_ = null;
               }
               else
               {
                  _loc3_ = new TraxChannelSample(_loc7_,_loc11_);
               }
            }
            _loc8_ = const_183;
            if(this.var_365 - this.var_212 < _loc8_)
            {
               _loc8_ = this.var_365 - this.var_212;
            }
            _loc9_ = 0;
            while(_loc9_ < _loc8_)
            {
               _loc12_ = _loc8_;
               if(_loc6_ < _loc5_.length - 1)
               {
                  _loc13_ = _loc5_.getKey(_loc6_ + 1);
                  if(_loc8_ + this.var_212 >= _loc13_)
                  {
                     _loc12_ = _loc13_ - this.var_212;
                  }
               }
               if(_loc12_ > _loc8_ - _loc9_)
               {
                  _loc12_ = _loc8_ - _loc9_;
               }
               if(_loc4_ == _loc2_ - 1)
               {
                  if(_loc3_ != null)
                  {
                     _loc3_.setSample(const_286,_loc9_,_loc12_);
                     _loc9_ += _loc12_;
                  }
                  else
                  {
                     _loc14_ = 0;
                     while(_loc14_ < _loc12_)
                     {
                        var _loc15_:*;
                        const_286[_loc15_ = _loc9_++] = 0;
                        _loc14_++;
                     }
                  }
               }
               else
               {
                  if(_loc3_ != null)
                  {
                     _loc3_.addSample(const_286,_loc9_,_loc12_);
                  }
                  _loc9_ += _loc12_;
               }
               if(_loc9_ < _loc8_)
               {
                  _loc7_ = _loc5_.getWithIndex(++_loc6_);
                  if(_loc7_ == null || _loc7_.id == 0)
                  {
                     _loc3_ = null;
                  }
                  else
                  {
                     _loc3_ = new TraxChannelSample(_loc7_,0);
                  }
               }
            }
            _loc4_--;
         }
      }
      
      private function checkSongFinishing() : void
      {
         var _loc1_:int = this.var_365 < this.var_1496 ? int(this.var_365) : (this.var_1496 > 0 ? int(this.var_1496) : int(this.var_365));
         if(this.var_212 > _loc1_ + this.var_1494 * (const_114 / 1000) && !this.var_648)
         {
            this.var_648 = true;
            if(this.var_443 != null)
            {
               this.var_443.reset();
               this.var_443.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onPlayingComplete);
            }
            this.var_443 = new Timer(2,1);
            this.var_443.start();
            this.var_443.addEventListener(TimerEvent.TIMER_COMPLETE,this.onPlayingComplete);
         }
         else if(this.var_212 > _loc1_ - this.var_442 && !this.var_788)
         {
            this.var_981 = false;
            this.var_788 = true;
            this.var_524 = 0;
         }
      }
      
      private function onSampleData(param1:SampleDataEvent) : void
      {
         if(param1.position > this.var_1218)
         {
            ++this.var_1894;
            Logger.log("Audio buffer under run...");
            this.var_1218 = param1.position;
         }
         if(this.volume > 0)
         {
            this.mixChannelsIntoBuffer();
         }
         var _loc2_:int = const_183;
         if(this.var_365 - this.var_212 < _loc2_)
         {
            _loc2_ = this.var_365 - this.var_212;
            if(_loc2_ < 0)
            {
               _loc2_ = 0;
            }
         }
         if(this.volume <= 0)
         {
            _loc2_ = 0;
         }
         this.writeAudioToOutputStream(param1.data,_loc2_);
         this.var_212 += const_183;
         this.var_1218 += const_183;
         if(this.var_441 != null)
         {
            this.var_1494 = param1.position / const_114 * 1000 - this.var_441.position;
         }
         this.checkSongFinishing();
      }
      
      private function writeAudioToOutputStream(param1:ByteArray, param2:int) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         if(param2 > 0)
         {
            if(!this.var_981 && !this.var_788)
            {
               this.writeMixingBufferToOutputStream(param1,param2);
            }
            else
            {
               if(this.var_981)
               {
                  _loc5_ = 1 / this.var_789;
                  _loc6_ = this.var_982 / Number(this.var_789);
                  this.var_982 += const_183;
                  if(this.var_982 > this.var_789)
                  {
                     this.var_981 = false;
                  }
               }
               else if(this.var_788)
               {
                  _loc5_ = -1 / this.var_442;
                  _loc6_ = 1 - this.var_524 / Number(this.var_442);
                  this.var_524 += const_183;
                  if(this.var_524 > this.var_442)
                  {
                     this.var_524 = this.var_442;
                  }
               }
               this.writeMixingBufferToOutputStreamWithFade(param1,param2,_loc6_,_loc5_);
            }
         }
         var _loc4_:int = param2;
         while(_loc4_ < const_183)
         {
            param1.writeFloat(0);
            param1.writeFloat(0);
            _loc4_++;
         }
      }
      
      private function writeMixingBufferToOutputStream(param1:ByteArray, param2:int) : void
      {
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         while(_loc4_ < param2)
         {
            _loc3_ = Number(0 * this.volume);
            param1.writeFloat(_loc3_);
            param1.writeFloat(_loc3_);
            _loc4_++;
         }
      }
      
      private function writeMixingBufferToOutputStreamWithFade(param1:ByteArray, param2:int, param3:Number, param4:Number) : void
      {
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         _loc6_ = 0;
         while(_loc6_ < param2)
         {
            if(param3 < 0 || param3 > 1)
            {
               break;
            }
            _loc5_ = Number(0 * this.volume * param3);
            param3 += param4;
            param1.writeFloat(_loc5_);
            param1.writeFloat(_loc5_);
            _loc6_++;
         }
         if(param3 < 0)
         {
            while(_loc6_ < param2)
            {
               param1.writeFloat(0);
               param1.writeFloat(0);
               _loc6_++;
            }
         }
         else if(param3 > 1)
         {
            while(_loc6_ < param2)
            {
               _loc5_ = Number(0 * this.volume);
               param3 += param4;
               param1.writeFloat(_loc5_);
               param1.writeFloat(_loc5_);
               _loc6_++;
            }
         }
      }
      
      private function onPlayingComplete(param1:TimerEvent) : void
      {
         if(this.var_648)
         {
            this.playingComplete();
         }
      }
      
      private function onFadeOutComplete(param1:TimerEvent) : void
      {
         this.removeFadeoutStopTimer();
         this.playingComplete();
      }
      
      private function playingComplete() : void
      {
         this.stopImmediately();
         this._events.dispatchEvent(new SoundCompleteEvent(SoundCompleteEvent.TRAX_SONG_COMPLETE,this.var_1635));
      }
      
      private function removeFadeoutStopTimer() : void
      {
         if(this.var_649 != null)
         {
            this.var_649.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onFadeOutComplete);
            this.var_649.reset();
            this.var_649 = null;
         }
      }
      
      private function removeStopTimer() : void
      {
         if(this.var_443 != null)
         {
            this.var_443.reset();
            this.var_443.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onPlayingComplete);
            this.var_443 = null;
         }
      }
   }
}
