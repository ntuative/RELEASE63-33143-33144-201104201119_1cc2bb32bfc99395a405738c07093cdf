package com.sulake.habbo.friendbar.view.utils
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.ITextWindow;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class TextCropper implements IDisposable
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_545:TextField;
      
      private var var_1028:TextFormat;
      
      private var var_2945:String = "...";
      
      private var var_2944:int = 20;
      
      public function TextCropper()
      {
         super();
         this.var_545 = new TextField();
         this.var_545.autoSize = TextFieldAutoSize.LEFT;
         this.var_1028 = this.var_545.defaultTextFormat;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.var_545 = null;
            this._disposed = true;
         }
      }
      
      public function crop(param1:ITextWindow) : void
      {
         var _loc3_:int = 0;
         this.var_1028.font = param1.fontFace;
         this.var_1028.size = param1.fontSize;
         this.var_1028.bold = param1.bold;
         this.var_1028.italic = param1.italic;
         this.var_545.setTextFormat(this.var_1028);
         this.var_545.text = param1.getLineText(0);
         var _loc2_:int = this.var_545.textWidth;
         if(_loc2_ > param1.width)
         {
            _loc3_ = this.var_545.getCharIndexAtPoint(param1.width - this.var_2944,this.var_545.textHeight / 2);
            param1.text = param1.text.slice(0,_loc3_) + this.var_2945;
         }
      }
   }
}
