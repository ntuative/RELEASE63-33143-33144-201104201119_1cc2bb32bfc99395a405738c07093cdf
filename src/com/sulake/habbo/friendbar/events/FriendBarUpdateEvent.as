package com.sulake.habbo.friendbar.events
{
   import flash.events.Event;
   
   public class FriendBarUpdateEvent extends Event
   {
      
      public static const const_911:String = "FBE_UPDATED";
       
      
      public function FriendBarUpdateEvent()
      {
         super(const_911,false,false);
      }
   }
}
