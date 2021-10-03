package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1240:String;
      
      private var var_1443:Array;
      
      private var var_1300:Array;
      
      private var var_2034:int;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get question() : String
      {
         return this.var_1240;
      }
      
      public function get choices() : Array
      {
         return this.var_1443.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1300.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_2034;
      }
      
      public function flush() : Boolean
      {
         this.var_1240 = "";
         this.var_1443 = [];
         this.var_1300 = [];
         this.var_2034 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1240 = param1.readString();
         this.var_1443 = [];
         this.var_1300 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            this.var_1443.push(param1.readString());
            this.var_1300.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2034 = param1.readInteger();
         return true;
      }
   }
}
