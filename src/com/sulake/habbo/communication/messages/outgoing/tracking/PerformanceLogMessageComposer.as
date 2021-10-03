package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2373:int = 0;
      
      private var var_1486:String = "";
      
      private var var_1877:String = "";
      
      private var var_2595:String = "";
      
      private var var_2603:String = "";
      
      private var var_1880:int = 0;
      
      private var var_2602:int = 0;
      
      private var var_2604:int = 0;
      
      private var var_1485:int = 0;
      
      private var var_2605:int = 0;
      
      private var var_1488:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2373 = param1;
         this.var_1486 = param2;
         this.var_1877 = param3;
         this.var_2595 = param4;
         this.var_2603 = param5;
         if(param6)
         {
            this.var_1880 = 1;
         }
         else
         {
            this.var_1880 = 0;
         }
         this.var_2602 = param7;
         this.var_2604 = param8;
         this.var_1485 = param9;
         this.var_2605 = param10;
         this.var_1488 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2373,this.var_1486,this.var_1877,this.var_2595,this.var_2603,this.var_1880,this.var_2602,this.var_2604,this.var_1485,this.var_2605,this.var_1488];
      }
   }
}
