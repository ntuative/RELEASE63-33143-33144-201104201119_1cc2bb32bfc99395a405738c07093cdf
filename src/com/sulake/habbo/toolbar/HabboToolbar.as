package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.window.IWindow;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.handshake.AuthenticationOKMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.tracking.ConversionPointMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import iid.IIDHabboWindowManager;
   
   public class HabboToolbar extends Component implements IHabboToolbar
   {
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_257:IHabboCommunicationManager;
      
      private var _config:IHabboConfigurationManager;
      
      private var _view:IToolbarView;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _state:Boolean = false;
      
      private var var_1458:LogoutController;
      
      private var var_1179:Boolean;
      
      private var _connection:IConnection;
      
      public function HabboToolbar(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         lock();
         this._assetLibrary = param3;
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerReady);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationManagerReady);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
      }
      
      override public function dispose() : void
      {
         this._state = false;
         this._connection = null;
         if(this.var_1458)
         {
            this.var_1458.dispose();
            this.var_1458 = null;
         }
         if(this.var_257)
         {
            this.var_257.release(new IIDHabboCommunicationManager());
            this.var_257 = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this._config)
         {
            this._config.release(new IIDHabboConfigurationManager());
            this._config = null;
         }
         if(this._view != null)
         {
            this._view.dispose();
            this._view = null;
         }
         super.dispose();
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_257 = IHabboCommunicationManager(param2);
         this._connection = this.var_257.getHabboMainConnection(null);
         this.tryInitialize();
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = IHabboWindowManager(param2);
         this.tryInitialize();
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._config = IHabboConfigurationManager(param2);
         this.var_1179 = this._config.getKey("client.toolbar.static.enabled","false") == "true";
         this.tryInitialize();
      }
      
      private function tryInitialize() : void
      {
         if(this.var_257 && this._windowManager && this._config)
         {
            this.var_257.addHabboConnectionMessageEvent(new AuthenticationOKMessageEvent(this.onAuthenticationOK));
            unlock();
         }
      }
      
      private function onAuthenticationOK(param1:IMessageEvent) : void
      {
         if(this.var_1179)
         {
            this._view = new ToolbarViewStatic(this,this._windowManager,this._assetLibrary,this._connection,events,this._config);
         }
         else
         {
            this._view = new ToolbarView(this,this._windowManager,this._assetLibrary,this._connection,events,this._config);
         }
         if(this._config && this._config.getKey("client.logout.enabled","false") == "true")
         {
            this.var_1458 = new LogoutController(this._windowManager,this._assetLibrary,events);
         }
         if(this._view == null)
         {
            return;
         }
         events.addEventListener(HabboToolbarSetIconEvent.const_130,this.onSetToolbarIconEvent);
         events.addEventListener(HabboToolbarSetIconEvent.const_1288,this.onSetToolbarIconBitmapEvent);
         events.addEventListener(HabboToolbarSetIconEvent.const_182,this.onRemoveToolbarIconEvent);
         events.addEventListener(HabboToolbarSetIconEvent.const_100,this.onSetToolbarIconStateEvent);
         events.addEventListener(HabboToolbarShowMenuEvent.const_59,this.onAnimateWindowEvent);
         events.addEventListener(HabboToolbarShowMenuEvent.const_500,this.onAnimateWindowEvent);
         events.addEventListener(HabboToolbarShowMenuEvent.const_1154,this.onDisplayWindowEvent);
         events.addEventListener(HabboToolbarShowMenuEvent.const_1076,this.onHideWindowEvent);
         this._state = true;
         events.dispatchEvent(new HabboToolbarEvent(HabboToolbarEvent.const_74));
      }
      
      private function onSetToolbarIconEvent(param1:HabboToolbarSetIconEvent) : void
      {
         var _loc2_:* = null;
         if(this._view != null && this._state)
         {
            if(param1.assetName != null)
            {
               _loc2_ = this.solveAssetBitmapData(param1.iconId,param1.assetName);
               this._view.setIconBitmap(param1.iconId,_loc2_);
            }
            else
            {
               this._view.setIcon(param1.iconId);
            }
         }
      }
      
      private function onSetToolbarIconStateEvent(param1:HabboToolbarSetIconEvent) : void
      {
         if(this._view != null && this._state)
         {
            this._view.setIconState(param1.iconId,param1.iconState);
         }
      }
      
      private function onSetToolbarIconBitmapEvent(param1:HabboToolbarSetIconEvent) : void
      {
         var _loc2_:* = null;
         if(this._view != null && this._state)
         {
            _loc2_ = param1.bitmapData;
            if(_loc2_ == null)
            {
               _loc2_ = this.solveAssetBitmapData(param1.iconId);
            }
            this._view.setIconBitmap(param1.iconId,_loc2_);
         }
      }
      
      private function onRemoveToolbarIconEvent(param1:HabboToolbarSetIconEvent) : void
      {
         if(this._view != null && this._state)
         {
            this._view.removeIcon(param1.iconId);
         }
      }
      
      public function toggleWindowVisibility(param1:String) : void
      {
         var _loc2_:String = "null";
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_36);
         _loc3_.iconId = _loc2_;
         _loc3_.iconName = param1;
         events.dispatchEvent(_loc3_);
         var _loc4_:ConversionPointMessageComposer = new ConversionPointMessageComposer("Toolbar",param1,"client.toolbar.clicked");
         if(this._connection)
         {
            this._connection.send(_loc4_);
         }
      }
      
      private function onAnimateWindowEvent(param1:HabboToolbarShowMenuEvent) : void
      {
         if(!this._state || !this._view)
         {
            return;
         }
         if(this.var_1179)
         {
            return;
         }
         if(param1.type == HabboToolbarShowMenuEvent.const_59)
         {
            if(param1.alignToIcon)
            {
               this._view.animateWindowIn(param1.menuId,param1.window);
            }
            else
            {
               this._view.animateWindowIn(param1.menuId,param1.window,new Point(param1.window.x,param1.window.y));
            }
         }
         else
         {
            this._view.animateWindowOut(param1.menuId,param1.window);
         }
      }
      
      private function onDisplayWindowEvent(param1:HabboToolbarShowMenuEvent) : void
      {
         if(!this._state || !this._view)
         {
            return;
         }
         if(this.var_1179)
         {
            this.toggleWindowVisibility(param1.menuId);
         }
         else
         {
            this._view.positionWindow(param1.menuId,param1.window);
         }
      }
      
      private function onHideWindowEvent(param1:HabboToolbarShowMenuEvent) : void
      {
         if(!this._state || !this._view)
         {
            return;
         }
         if(this.var_1179)
         {
            this.toggleWindowVisibility(param1.menuId);
         }
         else
         {
            this._view.hideWindow(param1.menuId,param1.window);
         }
      }
      
      private function solveAssetBitmapData(param1:String, param2:String = null) : BitmapData
      {
         if(param2 == null)
         {
            switch(param1)
            {
               case HabboToolbarIconEnum.CATALOGUE:
                  param2 = "catalogue_icon";
                  break;
               case HabboToolbarIconEnum.FRIENDLIST:
                  param2 = "friendlist_icon";
                  break;
               case HabboToolbarIconEnum.HAND:
                  param2 = "hand_icon";
                  break;
               case HabboToolbarIconEnum.HELP:
                  param2 = "help_icon";
                  break;
               case HabboToolbarIconEnum.INVENTORY:
                  param2 = "inventory_icon";
                  break;
               case HabboToolbarIconEnum.MEMENU:
                  param2 = "memenu_default_icon";
                  break;
               case HabboToolbarIconEnum.MESSENGER:
                  param2 = "messenger_icon";
                  break;
               case HabboToolbarIconEnum.NAVIGATOR:
                  param2 = "navigator_icon";
                  break;
               case HabboToolbarIconEnum.ROOMINFO:
                  param2 = "roominfo_icon";
                  break;
               case HabboToolbarIconEnum.SETTINGS:
                  param2 = "settings_icon";
                  break;
               case HabboToolbarIconEnum.ZOOM:
                  param2 = "zoomout_icon";
            }
         }
         var _loc3_:BitmapDataAsset = this._assetLibrary.getAssetByName(param2) as BitmapDataAsset;
         if(_loc3_ == null)
         {
            Logger.log("* Toolbar icon asset \'" + param2 + "\' not found!");
            return null;
         }
         var _loc4_:BitmapData = _loc3_.content as BitmapData;
         return _loc4_.clone();
      }
      
      public function get orientation() : String
      {
         if(this._view != null)
         {
            return this._view.orientation;
         }
         return "";
      }
      
      public function get size() : int
      {
         if(this._view != null)
         {
            return this._view.barSize;
         }
         return 0;
      }
      
      public function getIconLocation(param1:String) : int
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this._view != null && this._state)
         {
            _loc2_ = this._view.getIconByMenuId(param1);
            if(_loc2_)
            {
               _loc3_ = _loc2_.window;
               if(_loc3_)
               {
                  return _loc3_.y + _loc3_.height / 2;
               }
            }
         }
         switch(param1)
         {
            case HabboToolbarIconEnum.NAVIGATOR:
               return 60;
            case HabboToolbarIconEnum.QUESTS:
               return 230;
            default:
               return 0;
         }
      }
   }
}
