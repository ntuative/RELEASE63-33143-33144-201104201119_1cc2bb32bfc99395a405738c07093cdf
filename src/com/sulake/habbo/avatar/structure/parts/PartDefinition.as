package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2735:String;
      
      private var var_1974:String;
      
      private var var_2736:String;
      
      private var var_1975:Boolean;
      
      private var var_1973:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2735 = String(param1["set-type"]);
         this.var_1974 = String(param1["flipped-set-type"]);
         this.var_2736 = String(param1["remove-set-type"]);
         this.var_1975 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1973 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1973;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1973 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2735;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1974;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2736;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1975;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1975 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1974 = param1;
      }
   }
}
