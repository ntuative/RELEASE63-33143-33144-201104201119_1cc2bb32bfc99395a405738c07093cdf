package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_1356:Number = 12;
       
      
      private var var_2321:int = -1;
      
      private var var_2324:int = -2;
      
      private var var_203:Vector3d = null;
      
      private var var_1149:Number = 0;
      
      private var var_1756:Number = 0;
      
      private var var_1753:Boolean = false;
      
      private var var_179:Vector3d = null;
      
      private var var_1757:Vector3d;
      
      private var var_2326:Boolean = false;
      
      private var var_2327:Boolean = false;
      
      private var var_2323:Boolean = false;
      
      private var var_2328:Boolean = false;
      
      private var var_2329:int = 0;
      
      private var var_2325:int = 0;
      
      private var _scale:int = 0;
      
      private var var_2322:int = 0;
      
      private var var_2320:int = 0;
      
      private var var_1731:int = -1;
      
      private var var_1755:int = 0;
      
      private var var_1754:Boolean = false;
      
      public function RoomCamera()
      {
         this.var_1757 = new Vector3d();
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_179;
      }
      
      public function get targetId() : int
      {
         return this.var_2321;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2324;
      }
      
      public function get targetObjectLoc() : IVector3d
      {
         return this.var_1757;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2326;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2327;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2323;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2328;
      }
      
      public function get screenWd() : int
      {
         return this.var_2329;
      }
      
      public function get screenHt() : int
      {
         return this.var_2325;
      }
      
      public function get scale() : int
      {
         return this._scale;
      }
      
      public function get roomWd() : int
      {
         return this.var_2322;
      }
      
      public function get roomHt() : int
      {
         return this.var_2320;
      }
      
      public function get geometryUpdateId() : int
      {
         return this.var_1731;
      }
      
      public function get isMoving() : Boolean
      {
         if(this.var_203 != null && this.var_179 != null)
         {
            return true;
         }
         return false;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2321 = param1;
      }
      
      public function set targetObjectLoc(param1:IVector3d) : void
      {
         this.var_1757.assign(param1);
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2324 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2326 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2327 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2323 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2328 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2329 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2325 = param1;
      }
      
      public function set scale(param1:int) : void
      {
         if(this._scale != param1)
         {
            this._scale = param1;
            this.var_1754 = true;
         }
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2322 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2320 = param1;
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         this.var_1731 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         var _loc2_:* = null;
         if(this.var_203 == null)
         {
            this.var_203 = new Vector3d();
         }
         if(this.var_203.x != param1.x || this.var_203.y != param1.y || this.var_203.z != param1.z)
         {
            this.var_203.assign(param1);
            this.var_1755 = 0;
            _loc2_ = Vector3d.dif(this.var_203,this.var_179);
            this.var_1149 = _loc2_.length;
            this.var_1753 = true;
         }
      }
      
      public function dispose() : void
      {
         this.var_203 = null;
         this.var_179 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_179 != null)
         {
            return;
         }
         this.var_179 = new Vector3d();
         this.var_179.assign(param1);
      }
      
      public function resetLocation(param1:IVector3d) : void
      {
         if(this.var_179 == null)
         {
            this.var_179 = new Vector3d();
         }
         this.var_179.assign(param1);
      }
      
      public function update(param1:uint, param2:Number) : void
      {
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(this.var_203 != null && this.var_179 != null)
         {
            ++this.var_1755;
            if(this.var_1754)
            {
               this.var_1754 = false;
               this.var_179 = this.var_203;
               this.var_203 = null;
               return;
            }
            _loc3_ = Vector3d.dif(this.var_203,this.var_179);
            if(_loc3_.length > this.var_1149)
            {
               this.var_1149 = _loc3_.length;
            }
            if(_loc3_.length <= param2)
            {
               this.var_179 = this.var_203;
               this.var_203 = null;
            }
            else
            {
               _loc4_ = Math.sin(0 * _loc3_.length / this.var_1149);
               _loc5_ = param2 * 0.5;
               _loc6_ = this.var_1149 / const_1356;
               _loc7_ = _loc5_ + (_loc6_ - _loc5_) * _loc4_;
               if(this.var_1753)
               {
                  if(_loc7_ < this.var_1756)
                  {
                     _loc7_ = this.var_1756;
                  }
                  else
                  {
                     this.var_1753 = false;
                  }
               }
               this.var_1756 = _loc7_;
               _loc3_.div(_loc3_.length);
               _loc3_.mul(_loc7_);
               this.var_179 = Vector3d.sum(this.var_179,_loc3_);
            }
         }
      }
   }
}
