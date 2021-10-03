package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetMultiColoursEvent extends Event
   {
       
      
      private var var_1040:Array;
      
      private var var_2261:String;
      
      private var var_2260:String;
      
      private var var_2259:String;
      
      public function CatalogWidgetMultiColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_MULTI_COLOUR_ARRAY,param5,param6);
         this.var_1040 = param1;
         this.var_2261 = param2;
         this.var_2260 = param3;
         this.var_2259 = param4;
      }
      
      public function get colours() : Array
      {
         return this.var_1040;
      }
      
      public function get backgroundAssetName() : String
      {
         return this.var_2261;
      }
      
      public function get colourAssetName() : String
      {
         return this.var_2260;
      }
      
      public function get chosenColourAssetName() : String
      {
         return this.var_2259;
      }
   }
}
