package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener
   {
      
      private static const const_991:String = "avatar";
      
      private static const const_646:Number = -0.01;
      
      private static const const_645:Number = -0.409;
      
      private static const const_992:int = 2;
      
      private static const const_1351:Array = [0,0,0];
      
      private static const const_1352:int = 3;
       
      
      private var var_607:AvatarVisualizationData = null;
      
      private var var_534:Map;
      
      private var var_494:Map;
      
      private var var_1252:int = 0;
      
      private var var_948:Boolean;
      
      private var var_654:String;
      
      private var var_991:String;
      
      private var var_1251:int = 0;
      
      private var var_608:BitmapDataAsset;
      
      private var var_912:BitmapDataAsset;
      
      private var var_1713:int = -1;
      
      private var var_1707:int = -1;
      
      private var var_1710:int = -1;
      
      private const const_993:int = 0;
      
      private const const_1843:int = 1;
      
      private const const_1811:int = 2;
      
      private const const_1812:int = 3;
      
      private const const_1353:int = 4;
      
      private var var_1731:int = -1;
      
      private var var_250:String = "";
      
      private var _postureParameter:String = "";
      
      private var var_1709:Boolean = false;
      
      private var var_1712:Boolean = false;
      
      private var var_1711:Boolean = false;
      
      private var var_1406:Boolean = false;
      
      private var var_594:Boolean = false;
      
      private var var_1407:int = 0;
      
      private var var_1404:int = 0;
      
      private var var_2270:int = 0;
      
      private var var_732:int = 0;
      
      private var var_730:int = 0;
      
      private var var_609:int = 0;
      
      private var var_1405:int = 0;
      
      private var var_1131:Boolean = false;
      
      private var var_1708:Boolean = false;
      
      private var var_1130:int = 0;
      
      private var var_731:int = 0;
      
      private var var_1706:Boolean = false;
      
      private var var_1132:int = 0;
      
      private var var_60:IAvatarImage = null;
      
      private var var_1081:Boolean;
      
      public function AvatarVisualization()
      {
         super();
         this.var_534 = new Map();
         this.var_494 = new Map();
         this.var_948 = false;
      }
      
      override public function dispose() : void
      {
         if(this.var_534 != null)
         {
            this.resetImages();
            this.var_534.dispose();
            this.var_494.dispose();
            this.var_534 = null;
         }
         this.var_607 = null;
         this.var_608 = null;
         this.var_912 = null;
         super.dispose();
         this.var_1081 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1081;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         this.var_607 = param1 as AvatarVisualizationData;
         createSprites(this.const_1353);
         return true;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number, param3:Boolean) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:* = false;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param1.getUpdateID() != var_177)
         {
            _loc4_ = false;
            _loc5_ = false;
            _loc6_ = 0;
            _loc7_ = "";
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_283) > 0 && param3);
            if(_loc5_ != this.var_1709)
            {
               this.var_1709 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_391) > 0;
            if(_loc5_ != this.var_1712)
            {
               this.var_1712 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_432) > 0;
            if(_loc5_ != this.var_1711)
            {
               this.var_1711 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_692) > 0 && param3);
            if(_loc5_ != this.var_1406)
            {
               this.var_1406 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_1134) > 0;
            if(_loc5_ != this.var_594)
            {
               this.var_594 = _loc5_;
               _loc4_ = true;
               this.updateTypingBubble(param2);
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_136);
            if(_loc6_ != this.var_1407)
            {
               this.var_1407 = _loc6_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_233);
            if(_loc7_ != this.var_250)
            {
               this.var_250 = _loc7_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_880);
            if(_loc7_ != this._postureParameter)
            {
               this._postureParameter = _loc7_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_1236);
            if(_loc6_ != this.var_1404)
            {
               this.var_1404 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_463);
            if(_loc6_ != this.var_732)
            {
               this.var_732 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_578);
            if(_loc6_ != this.var_730)
            {
               this.var_730 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_375);
            if(_loc6_ != this.var_609)
            {
               this.var_609 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_189);
            if(_loc6_ != this.var_1713)
            {
               this.var_1713 = _loc6_;
               _loc4_ = true;
            }
            if(this.var_730 > 0 && param1.getNumber(RoomObjectVariableEnum.const_375) > 0)
            {
               if(this.var_609 != this.var_730)
               {
                  this.var_609 = this.var_730;
                  _loc4_ = true;
               }
            }
            else if(this.var_609 != 0)
            {
               this.var_609 = 0;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_867);
            if(_loc6_ != this.var_1130)
            {
               this.var_1130 = _loc6_;
               _loc4_ = true;
               this.updateNumberBubble(param2);
            }
            this.validateActions(param2);
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_1170);
            if(_loc7_ != this.var_991)
            {
               this.var_991 = _loc7_;
               _loc4_ = true;
            }
            _loc8_ = param1.getString(RoomObjectVariableEnum.const_191);
            if(this.updateFigure(_loc8_))
            {
               _loc4_ = true;
            }
            var_177 = param1.getUpdateID();
            return _loc4_;
         }
         return false;
      }
      
      private function updateFigure(param1:String) : Boolean
      {
         if(this.var_654 != param1)
         {
            this.var_654 = param1;
            this.resetImages();
            return true;
         }
         return false;
      }
      
      private function resetImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in this.var_534)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         for each(_loc1_ in this.var_494)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         this.var_534.reset();
         this.var_494.reset();
         this.var_60 = null;
         _loc2_ = getSprite(this.const_993);
         if(_loc2_ != null)
         {
            _loc2_.asset = null;
            _loc2_.alpha = 255;
         }
      }
      
      private function validateActions(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 < 48)
         {
            this.var_1406 = false;
         }
         if(this.var_250 == "sit" || this.var_250 == "lay")
         {
            this.var_1405 = param1 / 2;
         }
         else
         {
            this.var_1405 = 0;
         }
         this.var_1708 = false;
         this.var_1131 = false;
         if(this.var_250 == "lay")
         {
            this.var_1131 = true;
            _loc2_ = int(this._postureParameter);
            if(_loc2_ < 0)
            {
               this.var_1708 = true;
            }
         }
      }
      
      private function getAvatarImage(param1:Number, param2:int) : IAvatarImage
      {
         var _loc3_:* = null;
         var _loc4_:String = "avatarImage" + param1.toString();
         if(param2 == 0)
         {
            _loc3_ = this.var_534.getValue(_loc4_) as IAvatarImage;
         }
         else
         {
            _loc4_ += "-" + param2;
            _loc3_ = this.var_494.getValue(_loc4_) as IAvatarImage;
         }
         if(_loc3_ == null)
         {
            _loc3_ = this.var_607.getAvatar(this.var_654,param1,this.var_991,this);
            if(_loc3_ != null)
            {
               if(param2 == 0)
               {
                  this.var_534.add(_loc4_,_loc3_);
               }
               else
               {
                  if(this.var_494.length >= const_1352)
                  {
                     this.var_494.remove(this.var_494.getKeys().shift());
                  }
                  this.var_494.add(_loc4_,_loc3_);
               }
            }
         }
         return _loc3_;
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean, param4:Boolean = false) : Boolean
      {
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param4 || var_475 != param1.getUpdateID() || this.var_1731 != param2.updateId)
         {
            _loc5_ = param3;
            _loc6_ = param1.getDirection().x - param2.direction.x;
            _loc6_ = (_loc6_ % 360 + 360) % 360;
            _loc7_ = this.var_1713;
            if(this.var_250 == "float")
            {
               _loc7_ = _loc6_;
            }
            else
            {
               _loc7_ -= param2.direction.x;
            }
            _loc7_ = (_loc7_ % 360 + 360) % 360;
            if(_loc6_ != this.var_1707 || param4)
            {
               _loc5_ = true;
               this.var_1707 = _loc6_;
               _loc6_ -= 112.5;
               _loc6_ = (_loc6_ + 360) % 360;
               this.var_60.setDirectionAngle(AvatarSetType.const_37,_loc6_);
            }
            if(_loc7_ != this.var_1710 || param4)
            {
               _loc5_ = true;
               this.var_1710 = _loc7_;
               if(this.var_1710 != this.var_1707)
               {
                  _loc7_ -= 112.5;
                  _loc7_ = (_loc7_ + 360) % 360;
                  this.var_60.setDirectionAngle(AvatarSetType.const_50,_loc7_);
               }
            }
            var_475 = param1.getUpdateID();
            this.var_1731 = param2.updateId;
            return _loc5_;
         }
         return false;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1843);
         this.var_608 = null;
         if(this.var_250 == "mv" || this.var_250 == "std")
         {
            _loc2_.visible = true;
            if(this.var_608 == null || param1 != var_91)
            {
               _loc3_ = 0;
               _loc4_ = 0;
               if(param1 < 48)
               {
                  this.var_608 = this.var_60.getAsset("sh_std_sd_1_0_0");
                  _loc3_ = -8;
                  _loc4_ = -3;
               }
               else
               {
                  this.var_608 = this.var_60.getAsset("h_std_sd_1_0_0");
                  _loc3_ = -17;
                  _loc4_ = -7;
               }
               if(this.var_608 != null)
               {
                  _loc2_.asset = this.var_608.content as BitmapData;
                  _loc2_.offsetX = _loc3_;
                  _loc2_.offsetY = _loc4_;
                  _loc2_.alpha = 50;
                  _loc2_.relativeDepth = 1;
               }
               else
               {
                  _loc2_.visible = false;
               }
            }
         }
         else
         {
            this.var_608 = null;
            _loc2_.visible = false;
         }
      }
      
      private function updateTypingBubble(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.var_912 = null;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1811);
         if(this.var_594)
         {
            _loc2_.visible = true;
            _loc5_ = 64;
            if(param1 < 48)
            {
               this.var_912 = this.var_607.getAvatarRendererAsset("user_typing_small_png") as BitmapDataAsset;
               _loc3_ = 3;
               _loc4_ = -42;
               _loc5_ = 32;
            }
            else
            {
               this.var_912 = this.var_607.getAvatarRendererAsset("user_typing_png") as BitmapDataAsset;
               _loc3_ = 14;
               _loc4_ = -83;
            }
            if(this.var_250 == "sit")
            {
               _loc4_ += _loc5_ / 2;
            }
            else if(this.var_250 == "lay")
            {
               _loc4_ += _loc5_;
            }
            if(this.var_912 != null)
            {
               _loc2_.asset = this.var_912.content as BitmapData;
               _loc2_.offsetX = _loc3_;
               _loc2_.offsetY = _loc4_;
               _loc2_.relativeDepth = -0.02;
            }
         }
         else
         {
            _loc2_.visible = false;
         }
      }
      
      private function updateNumberBubble(param1:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc3_:IRoomObjectSprite = getSprite(this.const_1812);
         if(this.var_1130 > 0)
         {
            _loc6_ = 64;
            if(param1 < 48)
            {
               _loc2_ = this.var_607.getAvatarRendererAsset("number_" + this.var_1130 + "_small_png") as BitmapDataAsset;
               _loc4_ = -6;
               _loc5_ = -52;
               _loc6_ = 32;
            }
            else
            {
               _loc2_ = this.var_607.getAvatarRendererAsset("number_" + this.var_1130 + "_png") as BitmapDataAsset;
               _loc4_ = -8;
               _loc5_ = -105;
            }
            if(this.var_250 == "sit")
            {
               _loc5_ += _loc6_ / 2;
            }
            else if(this.var_250 == "lay")
            {
               _loc5_ += _loc6_;
            }
            if(_loc2_ != null)
            {
               _loc3_.visible = true;
               _loc3_.asset = _loc2_.content as BitmapData;
               _loc3_.offsetX = _loc4_;
               _loc3_.offsetY = _loc5_;
               _loc3_.relativeDepth = -0.01;
               this.var_731 = 1;
               this.var_1706 = true;
               this.var_1132 = 0;
               _loc3_.alpha = 0;
            }
            else
            {
               _loc3_.visible = false;
            }
         }
         else if(_loc3_.visible)
         {
            this.var_731 = -1;
         }
      }
      
      private function animateNumberBubble(param1:int) : Boolean
      {
         var _loc5_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1812);
         var _loc3_:int = _loc2_.alpha;
         var _loc4_:Boolean = false;
         if(this.var_1706)
         {
            ++this.var_1132;
            if(this.var_1132 < 10)
            {
               return false;
            }
            if(this.var_731 < 0)
            {
               if(param1 < 48)
               {
                  _loc2_.offsetY -= 2;
               }
               else
               {
                  _loc2_.offsetY -= 4;
               }
            }
            else
            {
               _loc5_ = 4;
               if(param1 < 48)
               {
                  _loc5_ = 8;
               }
               if(this.var_1132 % _loc5_ == 0)
               {
                  --_loc2_.offsetY;
                  _loc4_ = true;
               }
            }
         }
         if(this.var_731 > 0)
         {
            if(_loc3_ < 255)
            {
               _loc3_ += 32;
            }
            if(_loc3_ >= 255)
            {
               _loc3_ = 255;
               this.var_731 = 0;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         if(this.var_731 < 0)
         {
            if(_loc3_ >= 0)
            {
               _loc3_ -= 32;
            }
            if(_loc3_ <= 0)
            {
               this.var_731 = 0;
               this.var_1706 = false;
               _loc3_ = 0;
               _loc2_.visible = false;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         return _loc4_;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean, param4:Boolean) : void
      {
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:int = 0;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:* = null;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:* = null;
         var _loc32_:* = null;
         var _loc5_:IRoomObject = object;
         if(_loc5_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(this.var_607 == null)
         {
            return;
         }
         var _loc6_:IRoomObjectModel = _loc5_.getModel();
         var _loc7_:Number = param1.scale;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:int = this.var_732;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = this.updateModel(_loc6_,_loc7_,param3);
         if(this.animateNumberBubble(_loc7_))
         {
            increaseUpdateId();
         }
         if(_loc13_ || _loc7_ != var_91 || this.var_60 == null)
         {
            if(_loc7_ != var_91)
            {
               _loc9_ = true;
               this.validateActions(_loc7_);
            }
            if(_loc11_ != this.var_732)
            {
               _loc12_ = true;
            }
            if(_loc9_ || this.var_60 == null || _loc12_)
            {
               this.var_60 = this.getAvatarImage(_loc7_,this.var_732);
               if(this.var_60 == null)
               {
                  return;
               }
               _loc8_ = true;
               _loc16_ = getSprite(this.const_993);
               if(_loc16_ && this.var_60 && this.var_60.isPlaceholder())
               {
                  _loc16_.alpha = 150;
               }
               else if(_loc16_)
               {
                  _loc16_.alpha = 255;
               }
            }
            if(this.var_60 == null)
            {
               return;
            }
            this.updateShadow(_loc7_);
            if(_loc9_)
            {
               this.updateTypingBubble(_loc7_);
               this.updateNumberBubble(_loc7_);
            }
            _loc10_ = this.updateObject(_loc5_,param1,param3,true);
            this.updateActions(this.var_60);
            var_91 = _loc7_;
         }
         else
         {
            _loc10_ = this.updateObject(_loc5_,param1,param3);
         }
         var _loc14_:Boolean = _loc10_ || _loc13_ || _loc9_;
         var _loc15_:Boolean = (this.var_948 || this.var_1251 > 0) && param3;
         if(_loc14_)
         {
            this.var_1251 = const_992;
         }
         if(_loc14_ || _loc15_)
         {
            increaseUpdateId();
            --this.var_1251;
            --this.var_1252;
            if(!(this.var_1252 <= 0 || _loc9_ || _loc13_ || _loc8_))
            {
               return;
            }
            this.var_60.updateAnimationByFrames(1);
            this.var_1252 = const_992;
            _loc18_ = this.var_60.getCanvasOffsets();
            if(_loc18_ == null || _loc18_.length < 3)
            {
               _loc18_ = const_1351;
            }
            _loc17_ = getSprite(this.const_993);
            if(_loc17_ != null)
            {
               _loc21_ = this.var_60.getImage(AvatarSetType.const_37,false);
               if(_loc21_ != null)
               {
                  _loc17_.asset = _loc21_;
               }
               if(_loc17_.asset)
               {
                  _loc17_.offsetX = -1 * _loc7_ / 2 + _loc18_[0];
                  _loc17_.offsetY = -_loc17_.asset.height + _loc7_ / 4 + _loc18_[1] + this.var_1405;
               }
               if(this.var_1131)
               {
                  if(this.var_1708)
                  {
                     _loc17_.relativeDepth = -0.5;
                  }
                  else
                  {
                     _loc17_.relativeDepth = const_645 + _loc18_[2];
                  }
               }
               else
               {
                  _loc17_.relativeDepth = const_646 + _loc18_[2];
               }
            }
            _loc17_ = getSprite(this.const_1811);
            if(_loc17_ != null && _loc17_.visible)
            {
               if(!this.var_1131)
               {
                  _loc17_.relativeDepth = const_646 - 0.01 + _loc18_[2];
               }
               else
               {
                  _loc17_.relativeDepth = const_645 - 0.01 + _loc18_[2];
               }
            }
            this.var_948 = this.var_60.isAnimating();
            _loc19_ = this.const_1353;
            for each(_loc20_ in this.var_60.getSprites())
            {
               if(_loc20_.id == const_991)
               {
                  _loc17_ = getSprite(this.const_993);
                  _loc22_ = this.var_60.getLayerData(_loc20_);
                  _loc23_ = _loc20_.getDirectionOffsetX(this.var_60.getDirection());
                  _loc24_ = _loc20_.getDirectionOffsetY(this.var_60.getDirection());
                  if(_loc22_ != null)
                  {
                     _loc23_ += _loc22_.dx;
                     _loc24_ += _loc22_.dy;
                  }
                  if(_loc7_ < 48)
                  {
                     _loc23_ /= 2;
                     _loc24_ /= 2;
                  }
                  _loc17_.offsetX += _loc23_;
                  _loc17_.offsetY += _loc24_;
               }
               else
               {
                  _loc17_ = getSprite(_loc19_);
                  if(_loc17_ != null)
                  {
                     _loc17_.capturesMouse = false;
                     _loc17_.visible = true;
                     _loc25_ = this.var_60.getLayerData(_loc20_);
                     _loc26_ = 0;
                     _loc27_ = _loc20_.getDirectionOffsetX(this.var_60.getDirection());
                     _loc28_ = _loc20_.getDirectionOffsetY(this.var_60.getDirection());
                     _loc29_ = _loc20_.getDirectionOffsetZ(this.var_60.getDirection());
                     _loc30_ = 0;
                     if(_loc20_.hasDirections)
                     {
                        _loc30_ = this.var_60.getDirection();
                     }
                     if(_loc25_ != null)
                     {
                        _loc26_ = _loc25_.animationFrame;
                        _loc27_ += _loc25_.dx;
                        _loc28_ += _loc25_.dy;
                        _loc30_ += _loc25_.directionOffset;
                     }
                     if(_loc7_ < 48)
                     {
                        _loc27_ /= 2;
                        _loc28_ /= 2;
                     }
                     if(_loc30_ < 0)
                     {
                        _loc30_ += 8;
                     }
                     else if(_loc30_ > 7)
                     {
                        _loc30_ -= 8;
                     }
                     _loc31_ = this.var_60.getScale() + "_" + _loc20_.member + "_" + _loc30_ + "_" + _loc26_;
                     _loc32_ = this.var_60.getAsset(_loc31_);
                     if(_loc32_ == null)
                     {
                        continue;
                     }
                     _loc17_.asset = _loc32_.content as BitmapData;
                     _loc17_.offsetX = -_loc32_.offset.x - _loc7_ / 2 + _loc27_;
                     _loc17_.offsetY = -_loc32_.offset.y + _loc28_ + this.var_1405;
                     if(this.var_1131)
                     {
                        _loc17_.relativeDepth = const_645 - 0.001 * spriteCount * _loc29_;
                     }
                     else
                     {
                        _loc17_.relativeDepth = const_646 - 0.001 * spriteCount * _loc29_;
                     }
                     if(_loc20_.ink == 33)
                     {
                        _loc17_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc17_.blendMode = BlendMode.NORMAL;
                     }
                  }
                  _loc19_++;
               }
            }
         }
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_377,this.var_250,this._postureParameter);
         if(this.var_1407 > 0)
         {
            param1.appendAction(AvatarAction.const_304,AvatarAction.const_1699[this.var_1407]);
         }
         if(this.var_1404 > 0)
         {
            param1.appendAction(AvatarAction.DANCE,this.var_1404);
         }
         if(this.var_2270 > 0)
         {
            param1.appendAction(AvatarAction.const_857,this.var_2270);
         }
         if(this.var_730 > 0)
         {
            param1.appendAction(AvatarAction.const_955,this.var_730);
         }
         if(this.var_609 > 0)
         {
            param1.appendAction(AvatarAction.const_756,this.var_609);
         }
         if(this.var_1709)
         {
            param1.appendAction(AvatarAction.const_303);
         }
         if(this.var_1711 || this.var_1406)
         {
            param1.appendAction(AvatarAction.const_599);
         }
         if(this.var_1712)
         {
            param1.appendAction(AvatarAction.WAVE);
         }
         if(this.var_732 > 0)
         {
            param1.appendAction(AvatarAction.const_338,this.var_732);
         }
         param1.endActionAppends();
         this.var_948 = param1.isAnimating();
         var _loc2_:int = this.const_1353;
         for each(_loc3_ in this.var_60.getSprites())
         {
            if(_loc3_.id != const_991)
            {
               _loc2_++;
            }
         }
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
      
      public function avatarImageReady(param1:String) : void
      {
         this.resetImages();
      }
   }
}
