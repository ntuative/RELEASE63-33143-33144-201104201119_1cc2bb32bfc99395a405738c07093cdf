package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class InfoHotelClosedMessageParser implements IMessageParser
   {
       
      
      private var _openHour:int;
      
      private var var_1735:int;
      
      private var var_1734:Boolean;
      
      public function InfoHotelClosedMessageParser()
      {
         super();
      }
      
      public function get openHour() : int
      {
         return this._openHour;
      }
      
      public function get openMinute() : int
      {
         return this.var_1735;
      }
      
      public function get userThrownOutAtClose() : Boolean
      {
         return this.var_1734;
      }
      
      public function flush() : Boolean
      {
         this._openHour = 0;
         this.var_1735 = 0;
         this.var_1734 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._openHour = param1.readInteger();
         this.var_1735 = param1.readInteger();
         this.var_1734 = param1.readInteger() > 0;
         return true;
      }
   }
}
