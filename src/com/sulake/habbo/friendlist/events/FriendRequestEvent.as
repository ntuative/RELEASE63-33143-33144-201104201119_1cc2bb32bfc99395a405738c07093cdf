package com.sulake.habbo.friendlist.events
{
   import flash.events.Event;
   
   public class FriendRequestEvent extends Event
   {
      
      public static const const_63:String = "FRE_ACCEPTED";
      
      public static const const_296:String = "FRE_DECLINED";
       
      
      private var var_1142:int;
      
      public function FriendRequestEvent(param1:String, param2:int, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.var_1142 = param2;
      }
      
      public function get requestId() : int
      {
         return this.var_1142;
      }
   }
}
