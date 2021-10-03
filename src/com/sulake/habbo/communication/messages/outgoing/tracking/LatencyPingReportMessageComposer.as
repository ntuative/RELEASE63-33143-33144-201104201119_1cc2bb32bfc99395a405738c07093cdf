package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2248:int;
      
      private var var_2250:int;
      
      private var var_2249:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2248 = param1;
         this.var_2250 = param2;
         this.var_2249 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2248,this.var_2250,this.var_2249];
      }
      
      public function dispose() : void
      {
      }
   }
}
