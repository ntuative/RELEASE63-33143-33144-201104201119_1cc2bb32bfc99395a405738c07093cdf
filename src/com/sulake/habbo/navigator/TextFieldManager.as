package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   
   public class TextFieldManager
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var var_77:ITextFieldWindow;
      
      private var var_680:Boolean;
      
      private var var_1526:String = "";
      
      private var var_2029:int;
      
      private var var_2028:Function;
      
      private var var_2796:String = "";
      
      private var var_146:IWindowContainer;
      
      private var var_2794:Boolean;
      
      private var _orgTextBackgroundColor:uint;
      
      private var var_2795:uint;
      
      public function TextFieldManager(param1:HabboNavigator, param2:ITextFieldWindow, param3:int = 1000, param4:Function = null, param5:String = null)
      {
         super();
         this._navigator = param1;
         this.var_77 = param2;
         this.var_2029 = param3;
         this.var_2028 = param4;
         if(param5 != null)
         {
            this.var_680 = true;
            this.var_1526 = param5;
            this.var_77.text = param5;
         }
         Util.setProcDirectly(this.var_77,this.onInputClick);
         this.var_77.addEventListener(WindowKeyboardEvent.const_179,this.checkEnterPress);
         this.var_77.addEventListener(WindowEvent.const_101,this.checkMaxLen);
         this.var_2794 = this.var_77.textBackground;
         this._orgTextBackgroundColor = this.var_77.textBackgroundColor;
         this.var_2795 = this.var_77.textColor;
      }
      
      public function checkMandatory(param1:String) : Boolean
      {
         if(!this.isInputValid())
         {
            this.displayError(param1);
            return false;
         }
         this.restoreBackground();
         return true;
      }
      
      public function restoreBackground() : void
      {
         this.var_77.textBackground = this.var_2794;
         this.var_77.textBackgroundColor = this._orgTextBackgroundColor;
         this.var_77.textColor = this.var_2795;
      }
      
      public function displayError(param1:String) : void
      {
         this.var_77.textBackground = true;
         this.var_77.textBackgroundColor = 4294021019;
         this.var_77.textColor = 4278190080;
         if(this.var_146 == null)
         {
            this.var_146 = IWindowContainer(this._navigator.getXmlWindow("nav_error_popup"));
            this._navigator.refreshButton(this.var_146,"popup_arrow_down",true,null,0);
            IWindowContainer(this.var_77.parent).addChild(this.var_146);
         }
         var _loc2_:ITextWindow = ITextWindow(this.var_146.findChildByName("error_text"));
         _loc2_.text = param1;
         _loc2_.width = _loc2_.textWidth + 5;
         this.var_146.findChildByName("border").width = _loc2_.width + 15;
         this.var_146.width = _loc2_.width + 15;
         var _loc3_:Point = new Point();
         this.var_77.getLocalPosition(_loc3_);
         this.var_146.x = _loc3_.x;
         this.var_146.y = _loc3_.y - this.var_146.height + 3;
         var _loc4_:IWindow = this.var_146.findChildByName("popup_arrow_down");
         _loc4_.x = this.var_146.width / 2 - _loc4_.width / 2;
         this.var_146.x += (this.var_77.width - this.var_146.width) / 2;
         this.var_146.visible = true;
      }
      
      public function goBackToInitialState() : void
      {
         this.clearErrors();
         if(this.var_1526 != null)
         {
            this.var_77.text = this.var_1526;
            this.var_680 = true;
         }
         else
         {
            this.var_77.text = "";
            this.var_680 = false;
         }
      }
      
      public function getText() : String
      {
         if(this.var_680)
         {
            return this.var_2796;
         }
         return this.var_77.text;
      }
      
      public function setText(param1:String) : void
      {
         this.var_680 = false;
         this.var_77.text = param1;
      }
      
      public function clearErrors() : void
      {
         this.restoreBackground();
         if(this.var_146 != null)
         {
            this.var_146.visible = false;
         }
      }
      
      public function get input() : ITextFieldWindow
      {
         return this.var_77;
      }
      
      private function isInputValid() : Boolean
      {
         return !this.var_680 && Util.trim(this.getText()).length > 2;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_328)
         {
            return;
         }
         if(!this.var_680)
         {
            return;
         }
         this.var_77.text = this.var_2796;
         this.var_680 = false;
         this.restoreBackground();
      }
      
      private function checkEnterPress(param1:WindowKeyboardEvent) : void
      {
         if(param1.charCode == Keyboard.ENTER)
         {
            if(this.var_2028 != null)
            {
               this.var_2028();
            }
         }
      }
      
      private function checkMaxLen(param1:WindowEvent) : void
      {
         var _loc2_:String = this.var_77.text;
         if(_loc2_.length > this.var_2029)
         {
            this.var_77.text = _loc2_.substring(0,this.var_2029);
         }
      }
   }
}
