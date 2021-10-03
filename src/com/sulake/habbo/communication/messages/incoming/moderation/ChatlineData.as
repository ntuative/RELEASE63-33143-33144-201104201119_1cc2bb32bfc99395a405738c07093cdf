package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2814:int;
      
      private var var_2812:int;
      
      private var var_2813:int;
      
      private var var_2815:String;
      
      private var var_1672:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2814 = param1.readInteger();
         this.var_2812 = param1.readInteger();
         this.var_2813 = param1.readInteger();
         this.var_2815 = param1.readString();
         this.var_1672 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2814;
      }
      
      public function get minute() : int
      {
         return this.var_2812;
      }
      
      public function get chatterId() : int
      {
         return this.var_2813;
      }
      
      public function get chatterName() : String
      {
         return this.var_2815;
      }
      
      public function get msg() : String
      {
         return this.var_1672;
      }
   }
}
