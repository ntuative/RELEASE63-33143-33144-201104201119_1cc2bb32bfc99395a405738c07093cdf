package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PlacePostItMessageComposer implements IMessageComposer
   {
       
      
      private var var_1660:int;
      
      private var var_418:String;
      
      public function PlacePostItMessageComposer(param1:int, param2:String)
      {
         super();
         this.var_1660 = param1;
         this.var_418 = param2;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_1660,this.var_418];
      }
   }
}
