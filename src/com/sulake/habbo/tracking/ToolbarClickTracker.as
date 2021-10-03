package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1349:IHabboTracking;
      
      private var var_1651:Boolean = false;
      
      private var var_2637:int = 0;
      
      private var var_1899:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1349 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1349 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_1651 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2637 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_1651)
         {
            return;
         }
         ++this.var_1899;
         if(this.var_1899 <= this.var_2637)
         {
            this.var_1349.track("toolbar",param1);
         }
      }
   }
}
