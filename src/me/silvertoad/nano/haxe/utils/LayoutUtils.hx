package me.silvertoad.nano.haxe.utils;
import nme.display.DisplayObject;
import me.silvertoad.nano.haxe.core.group.INanoGroup;
class LayoutUtils {
    public static function getHeight(element:DisplayObject):Float {
        if (Std.is(element, INanoGroup)) {
            return cast(element, INanoGroup).nHeight;
        }
        return element.height;
    }

    public static function getWidth(element:DisplayObject):Float {
        if (Std.is(element, INanoGroup)) {
            return cast(element, INanoGroup).nWidth;
        }
        return element.width;
    }
}