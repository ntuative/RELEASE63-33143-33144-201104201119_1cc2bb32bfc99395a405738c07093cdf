package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_2956:uint;
      
      private var var_151:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_275:IWindowContext;
      
      private var var_1309:IMouseDraggingService;
      
      private var var_1307:IMouseScalingService;
      
      private var var_1308:IMouseListenerService;
      
      private var var_1306:IFocusManagerService;
      
      private var var_1305:IToolTipAgentService;
      
      private var var_1304:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2956 = 0;
         this.var_151 = param2;
         this.var_275 = param1;
         this.var_1309 = new WindowMouseDragger(param2);
         this.var_1307 = new WindowMouseScaler(param2);
         this.var_1308 = new WindowMouseListener(param2);
         this.var_1306 = new FocusManager(param2);
         this.var_1305 = new WindowToolTipAgent(param2);
         this.var_1304 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1309 != null)
         {
            this.var_1309.dispose();
            this.var_1309 = null;
         }
         if(this.var_1307 != null)
         {
            this.var_1307.dispose();
            this.var_1307 = null;
         }
         if(this.var_1308 != null)
         {
            this.var_1308.dispose();
            this.var_1308 = null;
         }
         if(this.var_1306 != null)
         {
            this.var_1306.dispose();
            this.var_1306 = null;
         }
         if(this.var_1305 != null)
         {
            this.var_1305.dispose();
            this.var_1305 = null;
         }
         if(this.var_1304 != null)
         {
            this.var_1304.dispose();
            this.var_1304 = null;
         }
         this.var_151 = null;
         this.var_275 = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1309;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1307;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1308;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1306;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1305;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1304;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
