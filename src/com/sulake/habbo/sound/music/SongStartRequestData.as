package com.sulake.habbo.sound.music
{
   import flash.utils.getTimer;
   
   public class SongStartRequestData
   {
       
      
      private var var_1635:int;
      
      private var var_1922:Number;
      
      private var var_2665:Number;
      
      private var var_2662:int;
      
      private var var_2664:Number;
      
      private var var_2663:Number;
      
      public function SongStartRequestData(param1:int, param2:Number, param3:Number, param4:Number = 2.0, param5:Number = 1.0)
      {
         super();
         this.var_1635 = param1;
         this.var_1922 = param2;
         this.var_2665 = param3;
         this.var_2664 = param4;
         this.var_2663 = param5;
         this.var_2662 = getTimer();
      }
      
      public function get songId() : int
      {
         return this.var_1635;
      }
      
      public function get startPos() : Number
      {
         if(this.var_1922 < 0)
         {
            return 0;
         }
         return this.var_1922 + (getTimer() - this.var_2662) / 1000;
      }
      
      public function get playLength() : Number
      {
         return this.var_2665;
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_2664;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_2663;
      }
   }
}
