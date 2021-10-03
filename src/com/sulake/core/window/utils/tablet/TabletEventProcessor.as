package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_2983:String = "";
      
      public function TabletEventProcessor()
      {
         super();
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         if(param2.length == 0)
         {
            return;
         }
         var_83 = param1.desktop;
         var_65 = param1.var_1323 as WindowController;
         var_176 = param1.var_1326 as WindowController;
         var_164 = param1.renderer;
         var_879 = param1.var_1325;
         param2.begin();
         param2.end();
         param1.desktop = var_83;
         param1.var_1323 = var_65;
         param1.var_1326 = var_176;
         param1.renderer = var_164;
         param1.var_1325 = var_879;
      }
   }
}
