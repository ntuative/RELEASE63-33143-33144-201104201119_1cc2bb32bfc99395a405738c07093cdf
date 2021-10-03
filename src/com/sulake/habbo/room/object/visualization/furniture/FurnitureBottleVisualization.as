package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1008:int = 20;
      
      private static const const_647:int = 9;
      
      private static const const_1370:int = -1;
       
      
      private var var_300:Array;
      
      private var var_778:Boolean = false;
      
      public function FurnitureBottleVisualization()
      {
         this.var_300 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_778)
            {
               this.var_778 = true;
               this.var_300 = new Array();
               this.var_300.push(const_1370);
               return;
            }
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(this.var_778)
            {
               this.var_778 = false;
               this.var_300 = new Array();
               this.var_300.push(const_1008);
               this.var_300.push(const_647 + param1);
               this.var_300.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(0))
         {
            if(this.var_300.length > 0)
            {
               super.setAnimation(this.var_300.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
