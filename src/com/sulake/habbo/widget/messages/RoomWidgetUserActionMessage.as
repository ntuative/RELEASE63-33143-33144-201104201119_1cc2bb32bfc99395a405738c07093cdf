package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_583:String = "RWUAM_WHISPER_USER";
      
      public static const const_474:String = "RWUAM_IGNORE_USER";
      
      public static const const_589:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_425:String = "RWUAM_KICK_USER";
      
      public static const const_483:String = "RWUAM_BAN_USER";
      
      public static const const_626:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_612:String = "RWUAM_RESPECT_USER";
      
      public static const const_472:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_485:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_554:String = "RWUAM_START_TRADING";
      
      public static const const_706:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_602:String = "RWUAM_KICK_BOT";
      
      public static const const_629:String = "RWUAM_REPORT";
      
      public static const const_622:String = "RWUAM_PICKUP_PET";
      
      public static const const_1498:String = "RWUAM_TRAIN_PET";
      
      public static const const_597:String = " RWUAM_RESPECT_PET";
      
      public static const const_400:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_768:String = "RWUAM_START_NAME_CHANGE";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
