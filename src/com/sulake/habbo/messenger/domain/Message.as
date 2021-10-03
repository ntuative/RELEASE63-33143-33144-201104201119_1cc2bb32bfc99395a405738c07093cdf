package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_773:int = 1;
      
      public static const const_846:int = 2;
      
      public static const const_776:int = 3;
      
      public static const const_1155:int = 4;
      
      public static const const_669:int = 5;
      
      public static const const_1262:int = 6;
       
      
      private var _type:int;
      
      private var var_1096:int;
      
      private var var_2573:String;
      
      private var var_2769:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1096 = param2;
         this.var_2573 = param3;
         this.var_2769 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2573;
      }
      
      public function get time() : String
      {
         return this.var_2769;
      }
      
      public function get senderId() : int
      {
         return this.var_1096;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
