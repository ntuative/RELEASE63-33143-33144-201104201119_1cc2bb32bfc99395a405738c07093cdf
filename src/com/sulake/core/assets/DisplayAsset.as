package com.sulake.core.assets
{
   import flash.display.DisplayObject;
   
   public class DisplayAsset implements IAsset
   {
       
      
      protected var var_1072:String;
      
      protected var var_181:DisplayObject;
      
      protected var _disposed:Boolean = false;
      
      protected var var_872:AssetTypeDeclaration;
      
      public function DisplayAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         this.var_872 = param1;
         this.var_1072 = param2;
      }
      
      public function get url() : String
      {
         return this.var_1072;
      }
      
      public function get content() : Object
      {
         return this.var_181;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return this.var_872;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this.var_181.loaderInfo != null)
            {
               if(this.var_181.loaderInfo.loader != null)
               {
                  this.var_181.loaderInfo.loader.unload();
               }
            }
            this.var_181 = null;
            this.var_872 = null;
            this._disposed = true;
            this.var_1072 = null;
         }
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is DisplayObject)
         {
            this.var_181 = param1 as DisplayObject;
            if(this.var_181 != null)
            {
               return;
            }
            throw new Error("Failed to convert DisplayObject to DisplayAsset!");
         }
         if(param1 is DisplayAsset)
         {
            this.var_181 = DisplayAsset(param1).var_181;
            this.var_872 = DisplayAsset(param1).var_872;
            if(this.var_181 == null)
            {
               throw new Error("Failed to read content from DisplayAsset!");
            }
         }
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is DisplayAsset)
         {
            this.var_181 = DisplayAsset(param1).var_181;
            this.var_872 = DisplayAsset(param1).var_872;
            return;
         }
         throw new Error("Provided asset should be of type DisplayAsset!");
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
   }
}
