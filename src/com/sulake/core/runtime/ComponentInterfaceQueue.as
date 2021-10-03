package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1957:IID;
      
      private var var_1081:Boolean;
      
      private var var_1245:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1957 = param1;
         this.var_1245 = new Array();
         this.var_1081 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_1957;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1081;
      }
      
      public function get receivers() : Array
      {
         return this.var_1245;
      }
      
      public function dispose() : void
      {
         if(!this.var_1081)
         {
            this.var_1081 = true;
            this.var_1957 = null;
            while(this.var_1245.length > 0)
            {
               this.var_1245.pop();
            }
            this.var_1245 = null;
         }
      }
   }
}
