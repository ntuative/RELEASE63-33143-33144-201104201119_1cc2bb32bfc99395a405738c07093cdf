package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1750:int;
      
      private var var_2760:String;
      
      private var var_1491:int;
      
      private var var_1113:int;
      
      private var var_1656:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1750 = param1.readInteger();
         this.var_2760 = param1.readString();
         this.var_1491 = param1.readInteger();
         this.var_1113 = param1.readInteger();
         this.var_1656 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1750;
      }
      
      public function get petName() : String
      {
         return this.var_2760;
      }
      
      public function get level() : int
      {
         return this.var_1491;
      }
      
      public function get petType() : int
      {
         return this.var_1113;
      }
      
      public function get breed() : int
      {
         return this.var_1656;
      }
      
      public function get color() : String
      {
         return this._color;
      }
   }
}
