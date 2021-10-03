package com.sulake.habbo.communication
{
   import com.sulake.habbo.communication.enum.HabboWeb;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.HTTPStatusEvent;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   
   public class HabboWebLogin extends EventDispatcher implements IHabboWebLogin
   {
       
      
      private var var_45:URLLoader;
      
      private var _name:String;
      
      private var _password:String;
      
      private var var_2797:String;
      
      private var var_2798:String;
      
      private var var_2799:String;
      
      public function HabboWebLogin(param1:String, param2:String, param3:String, param4:IEventDispatcher = null)
      {
         super(param4);
         this._name = param1;
         this._password = param2;
         this.var_2797 = "https://" + param3 + "/account/submit";
         this.var_2798 = "https://" + param3 + "/security_check";
         this.var_2799 = "https://" + param3 + "/account/reauthenticate";
      }
      
      public function init() : void
      {
         this.requestCredentials();
      }
      
      private function requestCredentials() : void
      {
         var _loc1_:String = "credentials.username=" + this._name + "&credentials.password=" + this._password;
         var _loc2_:URLRequest = new URLRequest(this.var_2797);
         _loc2_.data = new URLVariables(_loc1_);
         _loc2_.method = URLRequestMethod.POST;
         this.var_45 = new URLLoader();
         this.var_45.addEventListener(Event.COMPLETE,this.credentialsComplete);
         this.configureListeners(this.var_45);
         this.var_45.load(_loc2_);
      }
      
      private function credentialsComplete(param1:Event = null) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:String = _loc2_.data;
         if(_loc3_.indexOf("Redirecting") > -1 && _loc3_.indexOf("/useOrCreateAvatar/") != -1)
         {
            _loc4_ = /<meta http-equiv="Refresh" content="0;URL=(.*?)">/.exec(_loc3_)[1];
            _loc5_ = new URLRequest(_loc4_);
            this.var_45.load(_loc5_);
            return;
         }
         this.var_45.removeEventListener(Event.COMPLETE,this.credentialsComplete);
         this.removeListeners(this.var_45);
         if(_loc3_.indexOf("Redirecting") > -1)
         {
            this.requestSecurityCheck();
         }
         else if(_loc3_.indexOf("Habbo ~ Me") > -1)
         {
            dispatchEvent(new Event(HabboWeb.const_241));
         }
         else if(_loc3_.indexOf("Habbo ~ Home") > -1)
         {
            dispatchEvent(new Event(HabboWeb.const_241));
         }
         else if(_loc3_.indexOf("Habbo: Home") > -1)
         {
            dispatchEvent(new Event(HabboWeb.const_241));
         }
         else if(_loc3_.indexOf("document.habboLoggedIn = true") > -1)
         {
            dispatchEvent(new Event(HabboWeb.const_241));
         }
      }
      
      private function requestSecurityCheck() : void
      {
         var _loc1_:URLRequest = new URLRequest(this.var_2798);
         this.var_45 = new URLLoader();
         this.var_45.addEventListener(Event.COMPLETE,this.securityCheckComplete);
         this.configureListeners(this.var_45);
         this.var_45.load(_loc1_);
      }
      
      private function securityCheckComplete(param1:Event = null) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         this.var_45.removeEventListener(Event.COMPLETE,this.securityCheckComplete);
         this.removeListeners(this.var_45);
         var _loc3_:String = _loc2_.data;
         if(_loc3_.indexOf("Redirecting") > -1)
         {
            dispatchEvent(new Event(HabboWeb.const_241));
         }
      }
      
      public function requestReAuthenticate() : void
      {
         var _loc1_:String = "page=%2Fclient&credentials.password=" + this._password;
         var _loc2_:URLRequest = new URLRequest(this.var_2799);
         _loc2_.data = new URLVariables(_loc1_);
         _loc2_.method = URLRequestMethod.POST;
         this.var_45 = new URLLoader();
         this.var_45.addEventListener(Event.COMPLETE,this.reauthenticateComplete);
         this.configureListeners(this.var_45);
         this.var_45.load(_loc2_);
      }
      
      private function reauthenticateComplete(param1:Event = null) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         this.var_45.removeEventListener(Event.COMPLETE,this.reauthenticateComplete);
         this.removeListeners(this.var_45);
         var _loc3_:String = _loc2_.data;
         if(_loc3_.indexOf("Redirecting") > -1)
         {
            dispatchEvent(new Event(HabboWeb.const_241));
         }
         else
         {
            Logger.log("[HabboWebLogin] Reauthenticate completed but couldn\'t find \'Redirecting\' string. Something failed.");
            if(_loc3_.indexOf("You need to use secure log"))
            {
               Logger.log("[HabboWebLogin] Reason for failure: You need to use secure login in HK.");
            }
         }
      }
      
      private function configureListeners(param1:IEventDispatcher) : void
      {
         param1.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.securityErrorHandler);
         param1.addEventListener(HTTPStatusEvent.HTTP_STATUS,this.httpStatusHandler);
         param1.addEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
      }
      
      private function removeListeners(param1:IEventDispatcher) : void
      {
         param1.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.securityErrorHandler);
         param1.removeEventListener(HTTPStatusEvent.HTTP_STATUS,this.httpStatusHandler);
         param1.removeEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
      }
      
      private function ioErrorHandler(param1:IOErrorEvent) : void
      {
         Logger.log("[LoginToWeb] IOError: " + param1.text + " " + param1.type);
      }
      
      private function httpStatusHandler(param1:HTTPStatusEvent) : void
      {
         Logger.log("[LoginToWeb] HTTPStatus: " + param1.status + " " + param1.type);
      }
      
      private function securityErrorHandler(param1:SecurityErrorEvent) : void
      {
         Logger.log("[LoginToWeb] SecurityError: " + param1.text);
      }
   }
}
