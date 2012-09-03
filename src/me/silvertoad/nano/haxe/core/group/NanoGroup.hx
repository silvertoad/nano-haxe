package me.silvertoad.nano.haxe.core.group;

import me.silvertoad.nano.haxe.core.group.layout.NanoBaseLayout;
import me.silvertoad.nano.haxe.core.group.layout.align.NanoVerticalAlign;
import me.silvertoad.nano.haxe.core.group.layout.align.NanoHorizontalAlign;
import me.silvertoad.nano.haxe.core.group.layout.INanoLayout;
import nme.display.DisplayObject;
import nme.display.Sprite;

/**
 * Класс базового контейнера для выравнивания графических элементов
 */
class NanoGroup extends Sprite, implements INanoGroup {

    private var _measureHeight:Float;
    private var _measureWidth:Float;

    public function new(?layout:INanoLayout) {
        super();
        fixedWidth = 0;
        fixedHeight = 0;
        _measureHeight = 0;
        _measureWidth = 0;
        this.layout = layout != null ? layout : new NanoBaseLayout();
    }

    public var layout(default, _setLayout):INanoLayout;

    private function _setLayout(layout:INanoLayout):INanoLayout {
        if (this.layout != null) this.layout.container = null;
        layout.container = this;
        return this.layout = layout;
    }

    public var fixedWidth(default, null):Float;

    public var fixedHeight(default, null):Float;

    public var nWidth(_getWidth, _setWidth):Float;

    private function _getWidth():Float {
        return fixedWidth != 0 ? fixedWidth : (_measureWidth != 0 ? _measureWidth : width);
    }

    private function _setWidth(width:Float):Float {
        return fixedWidth = width;
    }

    public var nHeight(_getHeight, _setHeight):Float;

    private function _getHeight():Float {
        return fixedHeight != 0 ? fixedHeight : (_measureHeight != 0 ? _measureHeight : height);
    }

    private function _setHeight(height:Float):Float {
        return fixedHeight = height;
    }

    public function setMeasureHeight(measureHeight:Float) {
        _measureHeight = measureHeight;
    }

    public function setMeasureWidth(measureWidth:Float) {
        _measureWidth = measureWidth;
    }

    public function add(element:DisplayObject):INanoGroup {
        this.addChild(element);
        return this;
    }

    public function addAt(element:DisplayObject, index:Int):INanoGroup {
        this.addChildAt(element, index);
        return this;
    }

    public function build():DisplayObject {
        layout.realign();
        return this;
    }

    public function end():DisplayObject {
        return this;
    }

    public function remove(element:DisplayObject):DisplayObject {
        return removeAt(this.getChildIndex(element));
    }

    public function removeAt(index:Int):DisplayObject {
        return this.removeChildAt(index);
    }

    //                    __
    // .-----.--.--.-----.|  |_.---.-.--.--.    .-----.--.--.-----.---.-.----.
    // |__ --|  |  |     ||   _|  _  |_   _|    |__ --|  |  |  _  |  _  |   _|
    // |_____|___  |__|__||____|___._|__.__|    |_____|_____|___  |___._|__|
    //       |_____|                                        |_____|

    public function suGap(value:Float):INanoGroup {
        layout.gap = value;
        return this;
    }

    public function suPadLeft(value:Float):INanoGroup {
        layout.paddingLeft = value;
        return this;
    }

    public function suPadRight(value:Float):INanoGroup {
        layout.paddingRight = value;
        return this;
    }

    public function suPadTop(value:Float):INanoGroup {
        layout.paddingTop = value;
        return this;
    }

    public function suPadBottom(value:Float):INanoGroup {
        layout.paddingBottom = value;
        return this;
    }

    public function suHAlign(value:NanoHorizontalAlign):INanoGroup {
        layout.horizontalAlign = value;
        return this;
    }

    public function suVAlign(value:NanoVerticalAlign):INanoGroup {
        layout.verticalAlign = value;
        return this;
    }

    public function suWidth(value:Float):INanoGroup {
        nWidth = value;
        return this;
    }

    public function suHeight(value:Float):INanoGroup {
        nHeight = value;
        return this;
    }

    public function suX(value:Float):INanoGroup {
        x = value;
        return this;
    }

    public function suY(value:Float):INanoGroup {
        y = value;
        return this;
    }

}