package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var var_1318:Boolean;
      
      private var var_2378:int;
      
      private var var_2375:String;
      
      private var var_339:int;
      
      private var var_2377:int;
      
      private var var_2277:String;
      
      private var var_2376:String;
      
      private var var_2374:String;
      
      private var var_880:Array;
      
      private var _disposed:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_880 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1318 = false;
            return;
         }
         this.var_1318 = true;
         this.var_2378 = int(_loc2_);
         this.var_2375 = param1.readString();
         this.var_339 = int(param1.readString());
         this.var_2377 = param1.readInteger();
         this.var_2277 = param1.readString();
         this.var_2376 = param1.readString();
         this.var_2374 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_880.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_880 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get ownerAvatarId() : int
      {
         return this.var_2378;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2375;
      }
      
      public function get flatId() : int
      {
         return this.var_339;
      }
      
      public function get eventType() : int
      {
         return this.var_2377;
      }
      
      public function get eventName() : String
      {
         return this.var_2277;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2376;
      }
      
      public function get creationTime() : String
      {
         return this.var_2374;
      }
      
      public function get tags() : Array
      {
         return this.var_880;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1318;
      }
   }
}
