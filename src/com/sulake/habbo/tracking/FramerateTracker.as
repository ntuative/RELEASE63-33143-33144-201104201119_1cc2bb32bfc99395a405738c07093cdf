package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1663:int;
      
      private var var_2213:int;
      
      private var var_723:int;
      
      private var var_520:Number;
      
      private var var_2214:Boolean;
      
      private var var_2215:int;
      
      private var var_1662:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function get frameRate() : int
      {
         return Math.round(1000 / this.var_520);
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2213 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2215 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2214 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         ++this.var_723;
         if(this.var_723 == 1)
         {
            this.var_520 = param1;
            this.var_1663 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_723);
            this.var_520 = this.var_520 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2214 && param3 - this.var_1663 >= this.var_2213)
         {
            this.var_723 = 0;
            if(this.var_1662 < this.var_2215)
            {
               param2.track("performance","averageFramerate",this.frameRate);
               ++this.var_1662;
               this.var_1663 = param3;
            }
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
