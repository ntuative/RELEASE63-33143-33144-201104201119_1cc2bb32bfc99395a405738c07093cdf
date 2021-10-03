package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPurseUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomEngineUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_108:String = "me_menu_top_view";
      
      public static const const_1625:String = "me_menu_rooms_view";
      
      public static const const_312:String = "me_menu_my_clothes_view";
      
      public static const const_1213:String = "me_menu_dance_moves_view";
      
      public static const const_862:String = "me_menu_effects_view";
      
      public static const const_783:String = "me_menu_settings_view";
      
      public static const const_895:String = "me_menu_sound_settings";
      
      private static const const_1306:int = 5000;
      
      private static const const_971:Point = new Point(95,185);
       
      
      private var var_46:IMeMenuView;
      
      private var _mainContainer:IWindowContainer;
      
      private var _eventDispatcher:IEventDispatcher;
      
      private var var_1091:Point;
      
      private var var_1354:int = 0;
      
      private var var_2162:int = 0;
      
      private var var_2161:int = 0;
      
      private var var_2163:Boolean = false;
      
      private var var_1627:int = 0;
      
      private var var_1090:Boolean = false;
      
      private var var_2165:Boolean = false;
      
      private var var_409:Boolean = false;
      
      private var var_2160:int = 0;
      
      private var var_2164:Boolean = false;
      
      private var var_1626:int = 0;
      
      private var var_1625:Boolean = false;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_886:Boolean;
      
      public function MeMenuWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IEventDispatcher, param5:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         this._config = param5;
         this.var_1091 = new Point(0,0);
         this._eventDispatcher = param4;
         this.var_886 = this._config.getKey("client.toolbar.static.enabled","false") == "true";
         if(param5 != null && false)
         {
            this.var_2164 = param5.getKey("client.news.embed.enabled","false") == "true";
         }
         this.changeView(const_108);
         this.hide();
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         this.hide();
         this._eventDispatcher = null;
         if(this.var_46 != null)
         {
            this.var_46.dispose();
            this.var_46 = null;
         }
         super.dispose();
      }
      
      override public function get mainWindow() : IWindow
      {
         return this._mainContainer;
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_892,this.onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_829,this.onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_792,this.onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_722,this.onToolbarClicked);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_777,this.onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_696,this.onHideAvatarEditor);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_113,this.onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_227,this.onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_724,this.onAvatarActionEvent);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_125,this.onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_410,this.onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_128,this.onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_537,this.onTutorialEvent);
         param1.addEventListener(RoomWidgetPurseUpdateEvent.const_75,this.onCreditBalance);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_97,this.onNormalMode);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_427,this.onGameMode);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_892,this.onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_829,this.onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_792,this.onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_722,this.onToolbarClicked);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_113,this.onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_227,this.onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_724,this.onAvatarActionEvent);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_777,this.onHideAvatarEditor);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_696,this.onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_125,this.onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_410,this.onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_537,this.onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_128,this.onTutorialEvent);
         param1.removeEventListener(RoomWidgetPurseUpdateEvent.const_75,this.onCreditBalance);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_97,this.onNormalMode);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_97,this.onGameMode);
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         var _loc2_:* = null;
         if(!this.var_886)
         {
            _loc2_ = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_810);
            _loc2_.window = this._mainContainer.parent as IWindowContainer;
            if(messageListener != null)
            {
               messageListener.processWidgetMessage(_loc2_);
            }
         }
         if(this.var_46 != null)
         {
            this._mainContainer.removeChild(this.var_46.window);
            this.var_46.dispose();
            this.var_46 = null;
         }
         if(this.var_886)
         {
            this._mainContainer.visible = false;
         }
         this.var_409 = false;
         this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      private function show() : void
      {
         if(!this._mainContainer || !this._mainContainer.parent)
         {
            return;
         }
         this.changeView(const_108);
         if(this.var_886)
         {
            this._mainContainer.position = const_971;
            this._mainContainer.visible = true;
         }
         var _loc1_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_833);
         _loc1_.window = this._mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
         this.var_409 = true;
         this._mainContainer.activate();
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(this.var_409 && this.var_46.window.name == const_312))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_750);
            if(messageListener != null)
            {
               if(!this.var_1625)
               {
                  messageListener.processWidgetMessage(_loc2_);
               }
            }
         }
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!this.var_409)
         {
            return;
         }
         if(this.var_46.window.name == const_895)
         {
            (this.var_46 as MeMenuSoundSettingsView).updateSettings(param1);
         }
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_537:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + this.var_409 + " view: " + this.var_46.window.name);
               if(this.var_409 != true || this.var_46.window.name != const_108)
               {
                  return;
               }
               (this.var_46 as MeMenuMainView).setIconAssets("clothes_icon",const_108,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_128:
               this.hide();
         }
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         switch(param1.iconType)
         {
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU:
               this.var_409 = !this.var_409;
               break;
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO:
               this.var_409 = false;
               break;
            default:
               return;
         }
         if(this.var_409)
         {
            this.show();
         }
         else
         {
            this.hide();
         }
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         this.var_1090 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               this.var_1090 = true;
            }
         }
         if(this.var_46 != null && this.var_46.window.name == const_862)
         {
            (this.var_46 as MeMenuEffectsView).updateEffects(param1.effects);
         }
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(this.var_46 != null && this.var_46.window.name != const_312)
         {
            this.hide();
         }
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(this.var_46 != null && this.var_46.window.name == const_312)
         {
            this.changeView(const_108);
         }
      }
      
      private function onHideAvatarEditor(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(this.var_46 != null && this.var_46.window.name == const_312)
         {
            this.changeView(const_108);
         }
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = param1.daysLeft != this.var_1354;
         this.var_1354 = param1.daysLeft;
         this.var_2162 = param1.periodsLeft;
         this.var_2161 = param1.pastPeriods;
         this.var_2163 = param1.allowClubDances;
         _loc2_ = Boolean(_loc2_ || param1.clubLevel != this.var_1627);
         this.var_1627 = param1.clubLevel;
         if(_loc2_)
         {
            if(this.var_46 != null)
            {
               this.changeView(this.var_46.window.name);
            }
         }
      }
      
      private function onAvatarActionEvent(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               this.var_1090 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               this.var_1090 = false;
         }
      }
      
      private function onCreditBalance(param1:RoomWidgetPurseUpdateEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.var_1626 = param1.balance;
         localizations.registerParameter("widget.memenu.credits","credits",this.var_1626.toString());
      }
      
      private function onNormalMode(param1:RoomWidgetRoomEngineUpdateEvent) : void
      {
         this.var_1625 = false;
      }
      
      private function onGameMode(param1:RoomWidgetRoomEngineUpdateEvent) : void
      {
         this.var_1625 = true;
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(this._mainContainer == null)
         {
            this._mainContainer = windowManager.createWindow("me_menu_main_container","",HabboWindowType.const_1361,HabboWindowStyle.const_1166,HabboWindowParam.const_44,new Rectangle(0,0,170,260)) as IWindowContainer;
            if(!this.var_886)
            {
               this._mainContainer.tags.push("room_widget_me_menu");
            }
         }
         return this._mainContainer;
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case const_108:
               _loc2_ = new MeMenuMainView();
               this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_862:
               _loc2_ = new MeMenuEffectsView();
               this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_1213:
               _loc2_ = new MeMenuDanceView();
               this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_312:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_1625:
               _loc2_ = new MeMenuRoomsView();
               break;
            case const_783:
               _loc2_ = new MeMenuSettingsMenuView();
               break;
            case const_895:
               _loc2_ = new MeMenuSoundSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(this.var_46 != null)
            {
               this._mainContainer.removeChild(this.var_46.window);
               this.var_46.dispose();
               this.var_46 = null;
            }
            this.var_46 = _loc2_;
            this.var_46.init(this,param1);
         }
         this.updateSize();
         if(this.var_886 && param1 == const_108)
         {
            this.mainContainer.position = const_971;
         }
      }
      
      public function updateSize() : void
      {
         if(this.var_46 != null)
         {
            this.var_1091.x = this.var_46.window.width + 10;
            this.var_1091.y = this.var_46.window.height;
            this.var_46.window.x = 5;
            this.var_46.window.y = 0;
            this._mainContainer.width = this.var_1091.x;
            this._mainContainer.height = this.var_1091.y;
         }
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return this.var_2163;
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return this.var_1354 > 0;
      }
      
      public function get habboClubDays() : int
      {
         return this.var_1354;
      }
      
      public function get habboClubPeriods() : int
      {
         return this.var_2162;
      }
      
      public function get habboClubPastPeriods() : int
      {
         return this.var_2161;
      }
      
      public function get habboClubLevel() : int
      {
         return this.var_1627;
      }
      
      public function get isNewsEnabled() : Boolean
      {
         return this.var_2164;
      }
      
      public function get creditBalance() : int
      {
         return this.var_1626;
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return this._config;
      }
      
      public function changeToOutfit(param1:int) : void
      {
         this.var_2160 = getTimer();
         this.messageListener.processWidgetMessage(new RoomWidgetSelectOutfitMessage(param1));
      }
      
      public function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = getTimer();
         return _loc1_ - this.var_2160 > const_1306;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return this.var_1090;
      }
      
      public function get isDancing() : Boolean
      {
         return this.var_2165;
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         this.var_2165 = param1;
      }
   }
}
