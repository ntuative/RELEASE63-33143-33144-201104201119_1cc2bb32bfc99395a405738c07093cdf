package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_853:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_1081)
         {
            _structure = null;
            _assets = null;
            var_276 = null;
            var_287 = null;
            var_654 = null;
            var_572 = null;
            var_331 = null;
            if(!var_1343 && var_49)
            {
               var_49.dispose();
            }
            var_49 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_785 = null;
            var_1081 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_853[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_853[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_377:
               switch(_loc3_)
               {
                  case AvatarAction.const_809:
                  case AvatarAction.const_487:
                  case AvatarAction.const_383:
                  case AvatarAction.const_869:
                  case AvatarAction.const_428:
                  case AvatarAction.const_921:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_338:
            case AvatarAction.DANCE:
            case AvatarAction.WAVE:
            case AvatarAction.const_857:
            case AvatarAction.const_955:
            case AvatarAction.const_756:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
