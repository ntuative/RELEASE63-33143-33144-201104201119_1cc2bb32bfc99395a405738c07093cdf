package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_147:String = "RSPE_VOTE_QUESTION";
      
      public static const const_140:String = "RSPE_VOTE_RESULT";
       
      
      private var var_1240:String = "";
      
      private var var_1443:Array;
      
      private var var_1300:Array;
      
      private var var_2034:int = 0;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         this.var_1443 = [];
         this.var_1300 = [];
         super(param1,param2,param7,param8);
         this.var_1240 = param3;
         this.var_1443 = param4;
         this.var_1300 = param5;
         if(this.var_1300 == null)
         {
            this.var_1300 = [];
         }
         this.var_2034 = param6;
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
   }
}
