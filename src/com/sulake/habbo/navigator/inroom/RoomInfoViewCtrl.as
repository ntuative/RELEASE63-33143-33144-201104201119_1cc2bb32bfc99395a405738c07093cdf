package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.ToggleStaffPickMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var _window:IWindowContainer;
      
      private var var_181:IWindowContainer;
      
      private var var_2926:int;
      
      private var var_347:RoomEventViewCtrl;
      
      private var var_251:Timer;
      
      private var var_178:RoomSettingsCtrl;
      
      private var var_252:RoomThumbnailCtrl;
      
      private var var_1202:TagRenderer;
      
      private var var_296:IWindowContainer;
      
      private var var_422:IWindowContainer;
      
      private var var_734:IWindowContainer;
      
      private var var_2281:IWindowContainer;
      
      private var var_2276:IWindowContainer;
      
      private var var_1415:IWindowContainer;
      
      private var var_988:ITextWindow;
      
      private var var_1141:ITextWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_915:ITextWindow;
      
      private var var_1416:ITextWindow;
      
      private var var_1139:ITextWindow;
      
      private var var_919:ITextWindow;
      
      private var var_1722:ITextWindow;
      
      private var var_253:IWindowContainer;
      
      private var var_918:IWindowContainer;
      
      private var var_1720:IWindowContainer;
      
      private var var_2277:ITextWindow;
      
      private var var_735:ITextWindow;
      
      private var var_2278:IWindow;
      
      private var var_1414:IContainerButtonWindow;
      
      private var var_1412:IContainerButtonWindow;
      
      private var var_1410:IContainerButtonWindow;
      
      private var var_1413:IContainerButtonWindow;
      
      private var var_1417:IContainerButtonWindow;
      
      private var var_1724:IButtonWindow;
      
      private var var_1721:IButtonWindow;
      
      private var var_1723:IButtonWindow;
      
      private var var_917:IWindowContainer;
      
      private var var_1411:ITextWindow;
      
      private var var_1140:ITextFieldWindow;
      
      private var _buttons:IWindowContainer;
      
      private var var_1138:IButtonWindow;
      
      private var var_916:IButtonWindow;
      
      private var var_2279:String;
      
      private var var_2280:String;
      
      private var var_346:Boolean = true;
      
      private const const_499:int = 75;
      
      private const const_518:int = 3;
      
      private const const_516:int = 45;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_347 = new RoomEventViewCtrl(this._navigator);
         this.var_178 = new RoomSettingsCtrl(this._navigator,this,true);
         this.var_252 = new RoomThumbnailCtrl(this._navigator);
         this.var_1202 = new TagRenderer(this._navigator);
         this._navigator.roomSettingsCtrls.push(this.var_178);
         this.var_251 = new Timer(6000,1);
         this.var_251.addEventListener(TimerEvent.TIMER,this.hideInfo);
      }
      
      public function dispose() : void
      {
         if(this._navigator.toolbar)
         {
            this._navigator.toolbar.events.removeEventListener(HabboToolbarSetIconEvent.const_100,this.onToolbarIconState);
         }
         if(this.var_251)
         {
            this.var_251.removeEventListener(TimerEvent.TIMER,this.hideInfo);
            this.var_251.reset();
            this.var_251 = null;
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         this.refresh();
      }
      
      public function startEventEdit() : void
      {
         this.var_251.reset();
         this.var_347.active = true;
         this.var_178.active = false;
         this.var_252.active = false;
         this.reload();
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_251.reset();
         this.var_178.load(param1);
         this.var_178.active = true;
         this.var_347.active = false;
         this.var_252.active = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function backToRoomSettings() : void
      {
         this.var_178.active = true;
         this.var_347.active = false;
         this.var_252.active = false;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_251.reset();
         this.var_178.active = false;
         this.var_347.active = false;
         this.var_252.active = true;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      public function close() : void
      {
         if(this.var_346)
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_1076,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         }
         if(this._window == null)
         {
            return;
         }
         this._window.visible = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      public function reload() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.refresh();
         }
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_251.reset();
         this.var_347.active = false;
         this.var_178.active = false;
         this.var_252.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(this._navigator.data.enteredGuestRoom.flatId);
         }
         this.refresh();
         this._window.visible = true;
         if(this.var_346)
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_59,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         }
         this._window.parent.activate();
         this._window.activate();
         if(!param1)
         {
            this.var_251.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_251.reset();
         this.var_347.active = false;
         this.var_178.active = false;
         this.var_252.active = false;
         this.refresh();
         if(this.var_346)
         {
            if(!this._window.visible)
            {
               this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_59,HabboToolbarIconEnum.ROOMINFO,this._window,false));
               this._window.parent.activate();
            }
            else
            {
               this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_500,HabboToolbarIconEnum.ROOMINFO,this._window,false));
            }
         }
         else
         {
            this._window.visible = !this._window.visible;
            this._window.x = this._window.desktop.width - this._window.width - this.const_518;
            this._window.y = this.const_499;
            if(this._window.visible)
            {
               this._window.activate();
            }
         }
      }
      
      private function refresh() : void
      {
         var _loc1_:int = 0;
         this.prepareWindow();
         this.refreshRoom();
         this.refreshEvent();
         this.refreshEmbed();
         this.refreshButtons();
         if(this.var_346)
         {
            Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info","buttons_container"],0,2);
            this._window.height = Util.getLowestPoint(this._window);
            this._window.y = this._window.desktop.height - this._window.height - 5;
            Logger.log("MAIN: " + this.var_296.rectangle + ", " + this.var_253.rectangle + ", " + this._window.rectangle);
         }
         else
         {
            Util.moveChildrenToColumn(this.var_181,["room_info","event_info","embed_info","buttons_container"],0,2);
            this.var_181.height = Util.getLowestPoint(this.var_181);
            _loc1_ = this._window.desktop.height - this._window.height - this.const_516;
            if(this._window.y > _loc1_)
            {
               this._window.y = _loc1_ < 0 ? 0 : int(_loc1_);
            }
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(this.var_296);
         if(this.var_346)
         {
            this.var_296.findChildByName("close").visible = true;
         }
         var _loc1_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == this._navigator.data.homeRoomId;
         this.refreshRoomDetails(_loc1_,_loc2_);
         this.refreshPublicSpaceDetails(this._navigator.data.enteredPublicSpace);
         this.refreshRoomButtons(_loc2_);
         this.var_178.refresh(this.var_296);
         this.var_252.refresh(this.var_296);
         Util.moveChildrenToColumn(this.var_296,["room_details","room_buttons"],0,2);
         this.var_296.height = Util.getLowestPoint(this.var_296);
         this.var_296.visible = true;
         Logger.log("XORP: " + this.var_422.visible + ", " + this.var_1415.visible + ", " + this.var_734.visible + ", " + this.var_734.rectangle + ", " + this.var_296.rectangle);
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(this.var_253);
         var _loc1_:RoomEventData = this._navigator.data.roomEventData;
         this.refreshEventDetails(_loc1_);
         this.refreshEventButtons(_loc1_);
         this.var_347.refresh(this.var_253);
         if(Util.hasVisibleChildren(this.var_253) && !(this.var_178.active || this.var_252.active))
         {
            Util.moveChildrenToColumn(this.var_253,["event_details","event_buttons"],0,2);
            this.var_253.height = Util.getLowestPoint(this.var_253);
            this.var_253.visible = true;
         }
         else
         {
            this.var_253.visible = false;
         }
         Logger.log("EVENT: " + this.var_253.visible + ", " + this.var_253.rectangle);
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = this._navigator.configuration.getKey("embed.showInRoomInfo","false") == "true";
         var _loc2_:* = this._navigator.data.enteredGuestRoom != null;
         if(_loc2_ && _loc1_ && !this.var_178.active && !this.var_252.active && !this.var_347.active)
         {
            this.var_917.visible = true;
            this.var_1140.text = this.getEmbedData();
         }
         else
         {
            this.var_917.visible = false;
         }
      }
      
      private function refreshButtons() : void
      {
         var _loc1_:* = false;
         if(!this._buttons)
         {
            return;
         }
         if(this.var_178.active)
         {
            this._buttons.visible = false;
            return;
         }
         this._buttons.visible = true;
         if(this.var_1138)
         {
            if(this.var_2279 == "exit_homeroom")
            {
               this.var_1138.caption = "${navigator.homeroom}";
            }
            else
            {
               this.var_1138.caption = "${navigator.hotelview}";
            }
         }
         if(this.var_916)
         {
            _loc1_ = this._navigator.data.enteredGuestRoom != null;
            this.var_916.visible = _loc1_;
            if(this.var_2280 == "0")
            {
               this.var_916.caption = "${navigator.zoom.in}";
            }
            else
            {
               this.var_916.caption = "${navigator.zoom.out}";
            }
         }
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || this.var_178.active || this.var_252.active)
         {
            return;
         }
         this.var_988.text = param1.roomName;
         this.var_988.height = this.var_988.textHeight + 5;
         this._ownerName.text = param1.ownerName;
         this.var_915.text = param1.description;
         this.var_1202.refreshTags(this.var_422,param1.tags);
         this.var_915.visible = false;
         if(param1.description != "")
         {
            this.var_915.height = this.var_915.textHeight + 5;
            this.var_915.visible = true;
         }
         var _loc3_:Boolean = Boolean(this._navigator.configuration.getKey("client.allow.facebook.like") == "1");
         this._navigator.refreshButton(this.var_1412,"facebook_logo_small",_loc3_,null,0);
         this.var_1412.visible = _loc3_;
         var _loc4_:* = this._navigator.data.currentRoomRating == -1;
         this._navigator.refreshButton(this.var_1414,"thumb_up",_loc4_,null,0);
         this.var_1414.visible = _loc4_;
         this.var_919.visible = !_loc4_;
         this.var_1722.visible = !_loc4_;
         this.var_1722.text = "" + this._navigator.data.currentRoomRating;
         this.refreshStuffPick();
         this._navigator.refreshButton(this.var_422,"home",param2,null,0);
         this._navigator.refreshButton(this.var_422,"favourite",!param2 && this._navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(this.var_422,["room_name","owner_name_cont","tags","room_desc","rating_cont","staff_pick_button"],this.var_988.y,0);
         this.var_422.visible = true;
         this.var_422.height = Util.getLowestPoint(this.var_422);
      }
      
      private function refreshStuffPick() : void
      {
         var _loc1_:IWindow = this.var_422.findChildByName("staff_pick_button");
         if(!this._navigator.data.roomPicker)
         {
            _loc1_.visible = false;
            return;
         }
         _loc1_.visible = true;
         _loc1_.caption = this._navigator.getText(!!this._navigator.data.currentRoomIsStaffPick ? "navigator.staffpicks.unpick" : "navigator.staffpicks.pick");
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || this.var_178.active || this.var_252.active)
         {
            return;
         }
         this.var_1141.text = this._navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         this.var_1141.height = this.var_1141.textHeight + 5;
         this.var_1416.text = this._navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         this.var_1416.height = this.var_1416.textHeight + 5;
         Util.moveChildrenToColumn(this.var_734,["public_space_name","public_space_desc"],this.var_1141.y,0);
         this.var_734.visible = true;
         this.var_734.height = Math.max(86,Util.getLowestPoint(this.var_734));
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || this.var_347.active)
         {
            return;
         }
         this.var_2277.text = param1.eventName;
         this.var_735.text = param1.eventDescription;
         this.var_1202.refreshTags(this.var_918,[this._navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         this.var_735.visible = false;
         if(param1.eventDescription != "")
         {
            this.var_735.height = this.var_735.textHeight + 5;
            this.var_735.y = Util.getLowestPoint(this.var_918) + 2;
            this.var_735.visible = true;
         }
         this.var_918.visible = true;
         this.var_918.height = Util.getLowestPoint(this.var_918);
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(this._navigator.data.enteredGuestRoom == null || this.var_178.active || this.var_252.active)
         {
            return;
         }
         this.var_1724.visible = this._navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = this._navigator.data.isCurrentRoomFavourite();
         this.var_1410.visible = this._navigator.data.canAddFavourite && !_loc2_;
         this.var_1413.visible = this._navigator.data.canAddFavourite && _loc2_;
         this.var_1417.visible = this._navigator.data.canEditRoomSettings && !param1;
         this.var_1415.visible = Util.hasVisibleChildren(this.var_1415);
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(this.var_347.active)
         {
            return;
         }
         this.var_1721.visible = param1 == null && this._navigator.data.currentRoomOwner;
         this.var_1723.visible = param1 != null && (this._navigator.data.currentRoomOwner || this._navigator.data.eventMod);
         this.var_1720.visible = Util.hasVisibleChildren(this.var_1720);
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         if(this.var_346)
         {
            this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details"));
            this._window.setParamFlag(HabboWindowParam.const_61,false);
            this._window.setParamFlag(HabboWindowParam.const_1651,true);
         }
         else
         {
            this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details_framed"));
            this.var_181 = this._window.findChildByName("content") as IWindowContainer;
         }
         this._window.visible = false;
         this.var_296 = IWindowContainer(this.find("room_info"));
         this.var_422 = IWindowContainer(this.find("room_details"));
         this.var_734 = IWindowContainer(this.find("public_space_details"));
         this.var_2281 = IWindowContainer(this.find("owner_name_cont"));
         this.var_2276 = IWindowContainer(this.find("rating_cont"));
         this.var_1415 = IWindowContainer(this.find("room_buttons"));
         this.var_988 = ITextWindow(this.find("room_name"));
         this.var_1141 = ITextWindow(this.find("public_space_name"));
         this._ownerName = ITextWindow(this.find("owner_name"));
         this.var_915 = ITextWindow(this.find("room_desc"));
         this.var_1416 = ITextWindow(this.find("public_space_desc"));
         this.var_1139 = ITextWindow(this.find("owner_caption"));
         this.var_919 = ITextWindow(this.find("rating_caption"));
         this.var_1722 = ITextWindow(this.find("rating_txt"));
         this.var_253 = IWindowContainer(this.find("event_info"));
         this.var_918 = IWindowContainer(this.find("event_details"));
         this.var_1720 = IWindowContainer(this.find("event_buttons"));
         this.var_2277 = ITextWindow(this.find("event_name"));
         this.var_735 = ITextWindow(this.find("event_desc"));
         this.var_1412 = IContainerButtonWindow(this.find("facebook_like_button"));
         this.var_1414 = IContainerButtonWindow(this.find("rate_up_button"));
         this.var_2278 = this.find("staff_pick_button");
         this.var_1410 = IContainerButtonWindow(this.find("add_favourite_button"));
         this.var_1413 = IContainerButtonWindow(this.find("rem_favourite_button"));
         this.var_1417 = IContainerButtonWindow(this.find("make_home_button"));
         this.var_1724 = IButtonWindow(this.find("room_settings_button"));
         this.var_1721 = IButtonWindow(this.find("create_event_button"));
         this.var_1723 = IButtonWindow(this.find("edit_event_button"));
         this.var_917 = IWindowContainer(this.find("embed_info"));
         this.var_1411 = ITextWindow(this.find("embed_info_txt"));
         this.var_1140 = ITextFieldWindow(this.find("embed_src_txt"));
         this._buttons = IWindowContainer(this.find("buttons_container"));
         this.var_1138 = IButtonWindow(this.find("exit_room_button"));
         this.var_916 = IButtonWindow(this.find("zoom_button"));
         Util.setProcDirectly(this.var_1410,this.onAddFavouriteClick);
         Util.setProcDirectly(this.var_1413,this.onRemoveFavouriteClick);
         Util.setProcDirectly(this.var_1724,this.onRoomSettingsClick);
         Util.setProcDirectly(this.var_1417,this.onMakeHomeClick);
         Util.setProcDirectly(this.var_1721,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1723,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1140,this.onEmbedSrcClick);
         Util.setProcDirectly(this.var_1414,this.onThumbUp);
         Util.setProcDirectly(this.var_2278,this.onStaffPick);
         Util.setProcDirectly(this.var_1412,this.onFacebookLike);
         Util.setProcDirectly(this.var_916,this.onZoomClick);
         Util.setProcDirectly(this.var_1138,this.onExitRoomClick);
         this._navigator.refreshButton(this.var_1410,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1413,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1417,"home",true,null,0);
         if(this.var_346)
         {
            this._window.findChildByName("close").procedure = this.onCloseButtonClick;
         }
         else
         {
            this._window.findChildByTag("close").procedure = this.onCloseButtonClick;
         }
         Util.setProcDirectly(this.var_296,this.onHover);
         Util.setProcDirectly(this.var_253,this.onHover);
         this.var_1139.width = this.var_1139.textWidth;
         Util.moveChildrenToRow(this.var_2281,["owner_caption","owner_name"],this.var_1139.x,this.var_1139.y,3);
         this.var_919.width = this.var_919.textWidth;
         Util.moveChildrenToRow(this.var_2276,["rating_caption","rating_txt"],this.var_919.x,this.var_919.y,3);
         this.var_1411.height = this.var_1411.textHeight + 5;
         Util.moveChildrenToColumn(this.var_917,["embed_info_txt","embed_src_txt"],this.var_1411.y,2);
         this.var_917.height = Util.getLowestPoint(this.var_917) + 5;
         this.var_2926 = this._window.y + this._window.height;
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = this._window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!this._navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(this._navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(this._navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            this._navigator.send(new AddFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         this._navigator.send(new DeleteFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.roomEventData == null)
         {
            if(this._navigator.data.currentRoomOwner)
            {
               this._navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            this.startEventEdit();
         }
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         this.startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.hideInfo(null);
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function onStaffPick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new ToggleStaffPickMessageComposer(this._navigator.data.enteredGuestRoom.flatId,this._navigator.data.currentRoomIsStaffPick));
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function onFacebookLike(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         HabboWebTools.facebookLike(this._navigator.data.enteredGuestRoom.flatId);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_1140.setSelection(0,this.var_1140.text.length);
      }
      
      private function onZoomClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_36);
         _loc3_.iconId = HabboToolbarIconEnum.ZOOM;
         _loc3_.iconName = "ZOOM";
         this._navigator.toolbar.events.dispatchEvent(_loc3_);
      }
      
      private function onExitRoomClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_36);
         _loc3_.iconId = HabboToolbarIconEnum.EXITROOM;
         _loc3_.iconName = "EXITROOM";
         this._navigator.toolbar.events.dispatchEvent(_loc3_);
      }
      
      private function onToolbarIconState(param1:HabboToolbarSetIconEvent) : void
      {
         if(param1.type != HabboToolbarSetIconEvent.const_100)
         {
            return;
         }
         switch(param1.iconId)
         {
            case HabboToolbarIconEnum.ZOOM:
               this.var_2280 = param1.iconState;
               this.refreshButtons();
               break;
            case HabboToolbarIconEnum.EXITROOM:
               this.var_2279 = param1.iconState;
               this.refreshButtons();
         }
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         this.var_251.reset();
      }
      
      private function hideInfo(param1:Event) : void
      {
         if(this.var_346)
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_500,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         }
         else
         {
            this._window.visible = false;
         }
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + this._navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + this._navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = this._navigator.configuration.getKey("user.hash","");
         this._navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         this._navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         this._navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return this._navigator.getText("navigator.embed.src");
      }
      
      public function registerToolbarEvents() : void
      {
         if(this._navigator.toolbar)
         {
            this._navigator.toolbar.events.addEventListener(HabboToolbarSetIconEvent.const_100,this.onToolbarIconState);
         }
      }
      
      public function handleToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(!this.var_346 || param1.type != HabboToolbarEvent.const_36)
         {
            return;
         }
         switch(param1.iconId)
         {
            case HabboToolbarIconEnum.MEMENU:
               this.close();
               break;
            case HabboToolbarIconEnum.ROOMINFO:
               this.toggle();
         }
      }
      
      public function configure() : void
      {
         if(this._navigator.configuration)
         {
            this.var_346 = this._navigator.configuration.getKey("roominfo.widget.enabled") != "1";
         }
      }
      
      public function get useToolbar() : Boolean
      {
         return this.var_346;
      }
   }
}
