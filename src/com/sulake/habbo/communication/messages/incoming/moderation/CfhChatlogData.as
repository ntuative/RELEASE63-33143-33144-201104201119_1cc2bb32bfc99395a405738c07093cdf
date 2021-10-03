package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1811:int;
      
      private var var_2459:int;
      
      private var var_1452:int;
      
      private var var_2458:int;
      
      private var var_124:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1811 = param1.readInteger();
         this.var_2459 = param1.readInteger();
         this.var_1452 = param1.readInteger();
         this.var_2458 = param1.readInteger();
         this.var_124 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1811);
      }
      
      public function get callId() : int
      {
         return this.var_1811;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2459;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1452;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2458;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_124;
      }
   }
}
