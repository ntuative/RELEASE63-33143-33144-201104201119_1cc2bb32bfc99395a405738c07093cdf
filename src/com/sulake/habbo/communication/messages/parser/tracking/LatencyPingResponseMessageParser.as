package com.sulake.habbo.communication.messages.parser.tracking
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class LatencyPingResponseMessageParser implements IMessageParser
   {
       
      
      private var var_1142:int;
      
      public function LatencyPingResponseMessageParser()
      {
         super();
      }
      
      public function get requestId() : int
      {
         return this.var_1142;
      }
      
      public function flush() : Boolean
      {
         this.var_1142 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1142 = param1.readInteger();
         return true;
      }
   }
}
