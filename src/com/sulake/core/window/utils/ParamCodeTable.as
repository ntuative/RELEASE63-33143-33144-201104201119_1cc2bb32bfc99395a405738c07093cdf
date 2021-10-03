package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_215;
         param1["bound_to_parent_rect"] = const_99;
         param1["child_window"] = const_1072;
         param1["embedded_controller"] = const_1093;
         param1["resize_to_accommodate_children"] = const_67;
         param1["input_event_processor"] = const_31;
         param1["internal_event_handling"] = const_714;
         param1["mouse_dragging_target"] = const_274;
         param1["mouse_dragging_trigger"] = const_422;
         param1["mouse_scaling_target"] = const_298;
         param1["mouse_scaling_trigger"] = const_522;
         param1["horizontal_mouse_scaling_trigger"] = const_284;
         param1["vertical_mouse_scaling_trigger"] = const_278;
         param1["observe_parent_input_events"] = const_1130;
         param1["optimize_region_to_layout_size"] = const_568;
         param1["parent_window"] = const_1235;
         param1["relative_horizontal_scale_center"] = const_208;
         param1["relative_horizontal_scale_fixed"] = const_148;
         param1["relative_horizontal_scale_move"] = const_424;
         param1["relative_horizontal_scale_strech"] = const_404;
         param1["relative_scale_center"] = const_1109;
         param1["relative_scale_fixed"] = const_841;
         param1["relative_scale_move"] = const_1227;
         param1["relative_scale_strech"] = const_1111;
         param1["relative_vertical_scale_center"] = const_204;
         param1["relative_vertical_scale_fixed"] = const_156;
         param1["relative_vertical_scale_move"] = const_259;
         param1["relative_vertical_scale_strech"] = const_344;
         param1["on_resize_align_left"] = const_743;
         param1["on_resize_align_right"] = const_557;
         param1["on_resize_align_center"] = const_510;
         param1["on_resize_align_top"] = const_796;
         param1["on_resize_align_bottom"] = const_558;
         param1["on_resize_align_middle"] = const_613;
         param1["on_accommodate_align_left"] = const_1105;
         param1["on_accommodate_align_right"] = const_581;
         param1["on_accommodate_align_center"] = const_864;
         param1["on_accommodate_align_top"] = const_1065;
         param1["on_accommodate_align_bottom"] = const_528;
         param1["on_accommodate_align_middle"] = const_723;
         param1["route_input_events_to_parent"] = const_618;
         param1["use_parent_graphic_context"] = const_33;
         param1["draggable_with_mouse"] = const_1193;
         param1["scalable_with_mouse"] = const_1103;
         param1["reflect_horizontal_resize_to_parent"] = const_561;
         param1["reflect_vertical_resize_to_parent"] = const_471;
         param1["reflect_resize_to_parent"] = const_289;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1282;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
