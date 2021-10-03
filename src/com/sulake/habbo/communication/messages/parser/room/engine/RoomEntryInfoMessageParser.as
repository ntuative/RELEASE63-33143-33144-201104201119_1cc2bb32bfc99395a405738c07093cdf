package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1717:Boolean;
      
      private var var_2275:int;
      
      private var var_411:Boolean;
      
      private var var_1136:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function get privateRoom() : Boolean
      {
         return this.var_1717;
      }
      
      public function get guestRoomId() : int
      {
         return this.var_2275;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return this.var_1136;
      }
      
      public function get owner() : Boolean
      {
         return this.var_411;
      }
      
      public function flush() : Boolean
      {
         if(this.var_1136 != null)
         {
            this.var_1136.dispose();
            this.var_1136 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1717 = param1.readBoolean();
         if(this.var_1717)
         {
            this.var_2275 = param1.readInteger();
            this.var_411 = param1.readBoolean();
         }
         else
         {
            this.var_1136 = new PublicRoomShortData(param1);
         }
         return true;
      }
   }
}
