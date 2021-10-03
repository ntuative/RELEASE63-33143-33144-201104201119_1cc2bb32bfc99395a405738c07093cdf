package com.sulake.habbo.room.object.logic
{
   import com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.logic.ObjectLogicBase;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class MovingObjectLogic extends ObjectLogicBase
   {
      
      public static const const_944:int = 500;
      
      private static var var_899:Vector3d = new Vector3d();
       
      
      private var var_486:Vector3d;
      
      private var var_93:Vector3d;
      
      private var var_1659:int = 0;
      
      private var var_2212:int;
      
      private var var_1115:int = 500;
      
      public function MovingObjectLogic()
      {
         this.var_486 = new Vector3d();
         this.var_93 = new Vector3d();
         super();
      }
      
      protected function get lastUpdateTime() : int
      {
         return this.var_1659;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.var_93 = null;
         this.var_486 = null;
      }
      
      protected function set moveUpdateInterval(param1:int) : void
      {
         if(param1 <= 0)
         {
            param1 = 1;
         }
         this.var_1115 = param1;
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         super.processUpdateMessage(param1);
         var _loc2_:RoomObjectMoveUpdateMessage = param1 as RoomObjectMoveUpdateMessage;
         if(_loc2_ == null)
         {
            return;
         }
         if(object != null)
         {
            if(param1.loc != null)
            {
               this.var_93.assign(param1.loc);
               _loc3_ = _loc2_.targetLoc;
               this.var_2212 = this.var_1659;
               this.var_486.assign(_loc3_);
               this.var_486.sub(this.var_93);
            }
         }
      }
      
      override public function update(param1:int) : void
      {
         var _loc2_:int = 0;
         if(this.var_486.length > 0)
         {
            _loc2_ = param1 - this.var_2212;
            if(_loc2_ > this.var_1115)
            {
               _loc2_ = this.var_1115;
            }
            var_899.assign(this.var_486);
            var_899.mul(_loc2_ / Number(this.var_1115));
            var_899.add(this.var_93);
            if(object != null)
            {
               object.setLocation(var_899);
            }
            if(_loc2_ == this.var_1115)
            {
               this.var_486.x = 0;
               this.var_486.y = 0;
               this.var_486.z = 0;
            }
         }
         this.var_1659 = param1;
      }
   }
}
