package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   
   public class FurnitureGreetingNoteLogic extends FurnitureStickieLogic
   {
       
      
      public function FurnitureGreetingNoteLogic()
      {
         super();
      }
      
      override protected function setColorIndexFromItemData() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(object != null)
         {
            _loc1_ = object.getModel().getString(RoomObjectVariableEnum.const_88);
            _loc2_ = new Array("D6EBFF","FFD6FF","D7FFD7","FFFFD6");
            _loc3_ = _loc2_.indexOf(_loc1_);
            _loc3_ = _loc3_ < 0 ? 0 : int(_loc3_);
            object.getModelController().setNumber(RoomObjectVariableEnum.const_197,_loc3_ + 1);
         }
      }
   }
}
