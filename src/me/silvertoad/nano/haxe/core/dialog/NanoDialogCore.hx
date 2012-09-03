package me.silvertoad.nano.haxe.core.dialog;

import me.silvertoad.nano.haxe.core.group.layout.align.NanoVerticalAlign;
import me.silvertoad.nano.haxe.core.group.layout.align.NanoHorizontalAlign;
import nme.display.DisplayObject;
import me.silvertoad.nano.haxe.core.group.layout.INanoLayout;
import me.silvertoad.nano.haxe.core.group.NanoGroup;
import me.silvertoad.nano.haxe.core.group.INanoGroup;
import nme.display.Sprite;

class NanoDialogCore extends Sprite, implements INanoGroup {

    private var _container:NanoGroup;

    private var container(_getContainer, null):NanoGroup;

    private function _getContainer():NanoGroup {
        if (_container == null) {
            _container = new NanoGroup();
        }
        return _container;
    }

    public function new() {
        super();
        super.addChild(container);
    }

    // delegate methods

    public var nWidth(_getWidth, _setWidth):Float;

    private function _getWidth():Float {
        return container.width;
    }

    private function _setWidth(value:Float):Float {
        return container.width = value;
    }

    public var nHeight(_getHeight, _setHeight):Float;

    private function _getHeight():Float {
        return container.height;
    }

    private function _setHeight(value:Float):Float {
        return container.height = value;
    }

    public var layout(default, _setLayout):INanoLayout;

    //private function _getLayout():INanoLayout {
    //    return container.layout;
    //}

    private function _setLayout(value:INanoLayout):INanoLayout {
        return container.layout = value;
    }

    public var fixedWidth(default, null):Float;

    //private function _getFixedWidth():Float {
    //    return container.fixedWidth;
    //}

    public var fixedHeight(default, null):Float;

    //private function _getFixedHeight():Float {
    //    return container.fixedHeight;
    //}

    //public var measureWidth(null, _setMeasureWidth):Float;

    public function setMeasureWidth(measureWidth:Float):Void {
        container.setMeasureWidth(measureWidth);
    }

    //public var measureHeight(null, _setMeasureHeight):Float;

    public function setMeasureHeight(measureHeight:Float):Void {
        container.setMeasureHeight(measureHeight);
    }

    public function add(element:DisplayObject):INanoGroup {
        return container.add(element);
    }

    //public function setAt(element:DisplayObject, x:Float = null, y:Float = null):INanoGroup {
    //    return container.setAt(element, x, y);
    //}

    public function addAt(element:DisplayObject, index:Int):INanoGroup {
        return container.addAt(element, index);
    }

    public function build():DisplayObject {
        return container.build();
    }

    public function end():DisplayObject {
        return container.end();
    }

    public function remove(element:DisplayObject):DisplayObject {
        return container.remove(element);
    }

    public function removeAt(index:Int):DisplayObject {
        return container.removeAt(index);
    }

    public function suGap(value:Float):INanoGroup {
        return container.suGap(value);
    }

    public function suPadLeft(value:Float):INanoGroup {
        return container.suPadLeft(value);
    }

    public function suPadRight(value:Float):INanoGroup {
        return container.suPadRight(value);
    }

    public function suPadTop(value:Float):INanoGroup {
        return container.suPadTop(value);
    }

    public function suPadBottom(value:Float):INanoGroup {
        return container.suPadBottom(value);
    }

    public function suHAlign(value:NanoHorizontalAlign):INanoGroup {
        return container.suHAlign(value);
    }

    public function suVAlign(value:NanoVerticalAlign):INanoGroup {
        return container.suVAlign(value);
    }

    public function suWidth(value:Float):INanoGroup {
        return container.suWidth(value);
    }

    public function suHeight(value:Float):INanoGroup {
        return container.suHeight(value);
    }

    public function suX(value:Float):INanoGroup {
        return container.suX(value);
    }

    public function suY(value:Float):INanoGroup {
        return container.suY(value);
    }
}