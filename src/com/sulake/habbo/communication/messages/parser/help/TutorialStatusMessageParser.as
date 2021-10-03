package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1232:Boolean;
      
      private var var_1231:Boolean;
      
      private var var_1520:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1232;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1231;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1520;
      }
      
      public function flush() : Boolean
      {
         this.var_1232 = false;
         this.var_1231 = false;
         this.var_1520 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1232 = param1.readBoolean();
         this.var_1231 = param1.readBoolean();
         this.var_1520 = param1.readBoolean();
         return true;
      }
   }
}
