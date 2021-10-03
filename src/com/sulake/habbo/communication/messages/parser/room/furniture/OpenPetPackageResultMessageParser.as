package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageResultMessageParser implements IMessageParser
   {
       
      
      private var var_369:int = 0;
      
      private var var_1954:int = 0;
      
      private var var_1631:String = null;
      
      public function OpenPetPackageResultMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_369;
      }
      
      public function get nameValidationStatus() : int
      {
         return this.var_1954;
      }
      
      public function get nameValidationInfo() : String
      {
         return this.var_1631;
      }
      
      public function flush() : Boolean
      {
         this.var_369 = 0;
         this.var_1954 = 0;
         this.var_1631 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_369 = param1.readInteger();
         this.var_1954 = param1.readInteger();
         this.var_1631 = param1.readString();
         return true;
      }
   }
}
