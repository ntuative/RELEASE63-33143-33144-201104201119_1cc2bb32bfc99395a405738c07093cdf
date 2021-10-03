package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1915:int;
      
      private var var_2251:String;
      
      private var var_991:String;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1915 = param1.readInteger();
         this.var_2251 = param1.readString();
         this.var_991 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return this.var_1915;
      }
      
      public function get figureString() : String
      {
         return this.var_2251;
      }
      
      public function get gender() : String
      {
         return this.var_991;
      }
   }
}
