package me.silvertoad.nano.haxe.core.group.data.renderer;
import nme.display.DisplayObject;
import nme.Vector;
import me.silvertoad.nano.haxe.core.group.NanoGroup;
interface INanoItemRenderer<T> {
    function setData(data:T):Void;
    function getData():T;
}