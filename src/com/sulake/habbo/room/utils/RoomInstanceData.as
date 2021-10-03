package com.sulake.habbo.room.utils
{
   import com.sulake.core.utils.Map;
   
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_846:TileHeightMap = null;
      
      private var var_1282:LegacyWallGeometry = null;
      
      private var var_1283:RoomCamera = null;
      
      private var var_844:SelectedRoomObjectData = null;
      
      private var var_845:SelectedRoomObjectData = null;
      
      private var _worldType:String = null;
      
      private var var_550:Map;
      
      private var var_549:Map;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         this.var_550 = new Map();
         this.var_549 = new Map();
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_1282 = new LegacyWallGeometry();
         this.var_1283 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_846;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_846 != null)
         {
            this.var_846.dispose();
         }
         this.var_846 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_1282;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_1283;
      }
      
      public function get worldType() : String
      {
         return this._worldType;
      }
      
      public function set worldType(param1:String) : void
      {
         this._worldType = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_844;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_844 != null)
         {
            this.var_844.dispose();
         }
         this.var_844 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_845;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_845 != null)
         {
            this.var_845.dispose();
         }
         this.var_845 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_846 != null)
         {
            this.var_846.dispose();
            this.var_846 = null;
         }
         if(this.var_1282 != null)
         {
            this.var_1282.dispose();
            this.var_1282 = null;
         }
         if(this.var_1283 != null)
         {
            this.var_1283.dispose();
            this.var_1283 = null;
         }
         if(this.var_844 != null)
         {
            this.var_844.dispose();
            this.var_844 = null;
         }
         if(this.var_845 != null)
         {
            this.var_845.dispose();
            this.var_845 = null;
         }
         if(this.var_550 != null)
         {
            this.var_550.dispose();
            this.var_550 = null;
         }
         if(this.var_549 != null)
         {
            this.var_549.dispose();
            this.var_549 = null;
         }
      }
      
      public function addFurnitureData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_550.remove(param1.id);
            this.var_550.add(param1.id,param1);
         }
      }
      
      public function getFurnitureData() : FurnitureData
      {
         if(this.var_550.length > 0)
         {
            return this.getFurnitureDataWithId(this.var_550.getKey(0));
         }
         return null;
      }
      
      public function getFurnitureDataWithId(param1:int) : FurnitureData
      {
         return this.var_550.remove(param1);
      }
      
      public function addWallItemData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_549.remove(param1.id);
            this.var_549.add(param1.id,param1);
         }
      }
      
      public function getWallItemData() : FurnitureData
      {
         if(this.var_549.length > 0)
         {
            return this.getWallItemDataWithId(this.var_549.getKey(0));
         }
         return null;
      }
      
      public function getWallItemDataWithId(param1:int) : FurnitureData
      {
         return this.var_549.remove(param1);
      }
   }
}
