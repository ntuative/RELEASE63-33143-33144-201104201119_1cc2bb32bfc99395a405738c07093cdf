package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_654:String;
      
      private var var_2157:String;
      
      private var var_991:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         this.var_654 = param1;
         this.var_991 = param2;
         this.var_2157 = param3;
      }
      
      public function get figure() : String
      {
         return this.var_654;
      }
      
      public function get race() : String
      {
         return this.var_2157;
      }
      
      public function get gender() : String
      {
         return this.var_991;
      }
   }
}
