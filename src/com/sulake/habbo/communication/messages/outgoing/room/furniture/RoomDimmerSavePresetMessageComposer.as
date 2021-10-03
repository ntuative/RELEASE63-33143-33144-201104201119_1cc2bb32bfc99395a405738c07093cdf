package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2398:int;
      
      private var var_2396:int;
      
      private var var_2427:String;
      
      private var var_2426:int;
      
      private var var_2428:Boolean;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         this._roomId = param6;
         this._roomCategory = param7;
         this.var_2398 = param1;
         this.var_2396 = param2;
         this.var_2427 = param3;
         this.var_2426 = param4;
         this.var_2428 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2398,this.var_2396,this.var_2427,this.var_2426,int(this.var_2428)];
      }
      
      public function dispose() : void
      {
      }
   }
}
