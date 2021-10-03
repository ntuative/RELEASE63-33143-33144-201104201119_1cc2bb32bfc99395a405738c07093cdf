package com.sulake.habbo.widget.chatinput
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.exceptions.CrashMeError;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetChatInputContentUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFloodControlEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomViewUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetChatInputWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetChatMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class RoomChatInputWidgetOld extends RoomWidgetBase
   {
      
      private static const const_1354:int = 5000;
       
      
      private var _visualization:RoomChatInputViewOld;
      
      private var var_1733:String = "";
      
      private var var_739:int = 0;
      
      private var var_1419:Boolean = false;
      
      private var var_425:Timer = null;
      
      private var var_2299:int;
      
      private var var_2927:Boolean = false;
      
      private var var_22:Component = null;
      
      private var var_184:IHabboConfigurationManager;
      
      public function RoomChatInputWidgetOld(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IHabboConfigurationManager, param5:Component)
      {
         super(param1,param2,param3);
         this.var_22 = param5;
         this.var_184 = param4;
         this._visualization = new RoomChatInputViewOld(this,param1,param2,localizations);
      }
      
      public function get floodBlocked() : Boolean
      {
         return this.var_1419;
      }
      
      override public function dispose() : void
      {
         if(this._visualization != null)
         {
            this._visualization.dispose();
            this._visualization = null;
         }
         if(this.var_425 != null)
         {
            this.var_425.stop();
            this.var_425 = null;
         }
         this.var_22 = null;
         this.var_184 = null;
         super.dispose();
      }
      
      public function get allowPaste() : Boolean
      {
         return getTimer() - this.var_2299 > const_1354;
      }
      
      public function setLastPasteTime() : void
      {
         this.var_2299 = getTimer();
      }
      
      public function sendChat(param1:String, param2:int, param3:String = "") : void
      {
         if(this.var_1419)
         {
            return;
         }
         var _loc4_:RoomWidgetChatMessage = new RoomWidgetChatMessage(RoomWidgetChatMessage.const_595,param1,param2,param3);
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc4_);
         }
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_264,this.onRoomObjectSelected);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_113,this.onRoomObjectDeselected);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_347,this.onRoomViewUpdate);
         param1.addEventListener(RoomWidgetChatInputContentUpdateEvent.const_381,this.onChatInputUpdate);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_112,this.onUserInfo);
         param1.addEventListener(RoomWidgetFloodControlEvent.const_363,this.onFloodControl);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_264,this.onRoomObjectSelected);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_113,this.onRoomObjectDeselected);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_347,this.onRoomViewUpdate);
         param1.removeEventListener(RoomWidgetChatInputContentUpdateEvent.const_381,this.onChatInputUpdate);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_112,this.onUserInfo);
         param1.removeEventListener(RoomWidgetFloodControlEvent.const_363,this.onFloodControl);
      }
      
      private function onRoomViewUpdate(param1:RoomWidgetRoomViewUpdateEvent) : void
      {
         this.refreshWindowPosition();
      }
      
      private function onRoomObjectSelected(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var _loc2_:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_334,param1.id,param1.category);
      }
      
      private function onRoomObjectDeselected(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         this.var_1733 = "";
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         this.var_1733 = param1.name;
      }
      
      private function onChatInputUpdate(param1:RoomWidgetChatInputContentUpdateEvent) : void
      {
         var _loc2_:String = "";
         switch(param1.messageType)
         {
            case RoomWidgetChatInputContentUpdateEvent.const_699:
               _loc2_ = localizations.getKey("widgets.chatinput.mode.whisper",":tell");
               this._visualization.displaySpecialChatMessage(_loc2_,param1.userName);
               break;
            case RoomWidgetChatInputContentUpdateEvent.const_1140:
         }
      }
      
      private function refreshWindowPosition() : void
      {
         if(this._visualization == null)
         {
            return;
         }
         var _loc1_:RoomWidgetChatInputWidgetMessage = new RoomWidgetChatInputWidgetMessage(RoomWidgetChatInputWidgetMessage.const_785,this._visualization.window);
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
      }
      
      private function onReleaseTimerComplete(param1:TimerEvent) : void
      {
         Logger.log("Releasing flood blocking");
         this.var_1419 = false;
         if(this._visualization != null)
         {
            this._visualization.hideFloodBlocking();
         }
         this.var_425 = null;
      }
      
      private function onReleaseTimerTick(param1:TimerEvent) : void
      {
         if(this._visualization != null)
         {
            this.var_739 = this.var_739 - 1;
            this._visualization.showFloodBlocking(this.var_739);
         }
      }
      
      public function get selectedUserName() : String
      {
         return this.var_1733;
      }
      
      public function triggerManualCrash() : void
      {
         this.var_2927 = true;
         throw new CrashMeError();
      }
      
      public function onFloodControl(param1:RoomWidgetFloodControlEvent) : void
      {
         this.var_1419 = true;
         this.var_739 = param1.seconds;
         Logger.log("Enabling flood blocking for " + this.var_739 + " seconds");
         if(this.var_425)
         {
            this.var_425.reset();
         }
         else
         {
            this.var_425 = new Timer(1000,this.var_739);
            this.var_425.addEventListener(TimerEvent.TIMER,this.onReleaseTimerTick);
            this.var_425.addEventListener(TimerEvent.TIMER_COMPLETE,this.onReleaseTimerComplete);
         }
         this.var_425.start();
         if(this._visualization != null)
         {
            this._visualization.showFloodBlocking(this.var_739);
         }
      }
   }
}
