package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetCommandsMessageParser implements IMessageParser
   {
       
      
      private var var_1750:int;
      
      private var var_1425:Array;
      
      private var var_1144:Array;
      
      public function PetCommandsMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1750;
      }
      
      public function get allCommands() : Array
      {
         return this.var_1425;
      }
      
      public function get enabledCommands() : Array
      {
         return this.var_1144;
      }
      
      public function flush() : Boolean
      {
         this.var_1750 = -1;
         this.var_1425 = null;
         this.var_1144 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1750 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this.var_1425 = new Array();
         while(_loc2_-- > 0)
         {
            this.var_1425.push(param1.readInteger());
         }
         var _loc3_:int = param1.readInteger();
         this.var_1144 = new Array();
         while(_loc3_-- > 0)
         {
            this.var_1144.push(param1.readInteger());
         }
         return true;
      }
   }
}
