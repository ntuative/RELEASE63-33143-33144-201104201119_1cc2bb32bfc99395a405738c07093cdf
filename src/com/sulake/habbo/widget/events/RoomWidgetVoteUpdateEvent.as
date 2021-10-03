package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_147:String = "RWPUE_VOTE_QUESTION";
      
      public static const const_140:String = "RWPUE_VOTE_RESULT";
       
      
      private var var_1240:String;
      
      private var var_1443:Array;
      
      private var var_1300:Array;
      
      private var var_2034:int;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_1240 = param2;
         this.var_1443 = param3;
         this.var_1300 = param4;
         if(this.var_1300 == null)
         {
            this.var_1300 = [];
         }
         this.var_2034 = param5;
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
