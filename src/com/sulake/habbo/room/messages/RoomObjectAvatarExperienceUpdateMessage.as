package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarExperienceUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_2488:int;
      
      public function RoomObjectAvatarExperienceUpdateMessage(param1:int)
      {
         super();
         this.var_2488 = param1;
      }
      
      public function get gainedExperience() : int
      {
         return this.var_2488;
      }
   }
}
