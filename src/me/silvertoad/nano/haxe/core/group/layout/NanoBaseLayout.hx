package me.silvertoad.nano.haxe.core.group.layout;

import me.silvertoad.nano.haxe.utils.LayoutUtils;
import me.silvertoad.nano.haxe.core.group.INanoGroup;
import me.silvertoad.nano.haxe.core.group.layout.align.NanoVerticalAlign;
import me.silvertoad.nano.haxe.core.group.layout.align.NanoHorizontalAlign;
import nme.display.DisplayObject;
import me.silvertoad.nano.haxe.core.group.NanoGroup;

class NanoBaseLayout implements INanoLayout {

    public function new() {
        this.gap = 0;
        this.paddingLeft = 0;
        this.paddingRight = 0;
        this.paddingTop = 0;
        this.paddingBottom = 0;
        this.verticalAlign = NanoVerticalAlign.MIDDLE;
        this.horizontalAlign = NanoHorizontalAlign.CENTER;
    }

    public var container(default, default):NanoGroup;
    public var gap(default, default):Float;
    public var paddingLeft(default, default):Float;
    public var paddingRight(default, default):Float;
    public var paddingTop(default, default):Float;
    public var paddingBottom(default, default):Float;
    public var verticalAlign(default, default):NanoVerticalAlign;
    public var horizontalAlign(default, default):NanoHorizontalAlign;

    /**
    * Переформатировать
    */

    public function realign() {
        alignVertical();
        alignHorizontal();
    }

    /**
    * Произвести выравнивание по вертикали
    */

    private function alignVertical() {
        var maxHeight:Float = getMaxElementSide(false);

        for (i in 0...container.numChildren) {
            var element:DisplayObject = container.getChildAt(i);
            var height = LayoutUtils.getHeight(element);
            switch (verticalAlign) {
                case NanoVerticalAlign.TOP:
                    element.y = paddingTop;
                case NanoVerticalAlign.MIDDLE:
                    var _y:Float;
                    if (container.fixedHeight != 0) {
                        _y = (container.fixedHeight - height + paddingTop - paddingBottom) / 2;
                        element.y = _y;
                    } else {
                        element.y = paddingTop + (maxHeight - height) / 2;
                    }
                case NanoVerticalAlign.BOTTOM:
                    if (container.fixedHeight != 0) {
                        element.y = container.fixedHeight - height - paddingBottom;
                    } else {
                        element.y = paddingTop + (maxHeight - height);
                    }
            }
        }

        container.setMeasureHeight(paddingTop + maxHeight + paddingBottom);
    }

    /**
    * Произвести выравнивание по горизонтали
    */

    private function alignHorizontal() {
        var maxWidth:Float = getMaxElementSide(true);

        for (i in 0...container.numChildren) {
            var element:DisplayObject = container.getChildAt(i);
            var width = LayoutUtils.getWidth(element);
            switch (horizontalAlign) {
                case NanoHorizontalAlign.LEFT:
                    element.x = paddingLeft;
                case NanoHorizontalAlign.CENTER:
                    if (container.fixedWidth != 0) {
                        element.x = (container.fixedWidth - width + paddingLeft - paddingRight) / 2;
                    } else {
                        element.x = paddingLeft + (maxWidth - width) / 2;
                    }
                case NanoHorizontalAlign.RIGHT:
                    if (container.fixedWidth != 0) {
                        element.x = container.fixedWidth - width - paddingRight;
                    } else {
                        element.x = paddingLeft + (maxWidth - width);
                    }
            }
        }

        container.setMeasureWidth(paddingLeft + maxWidth + paddingRight);
    }

    /**
    * Найти наибольшую сторону среди элементов группы
    * @param byWidth если, true ищет по ширине, false - по высоте
    * @return наибольшая сторона
    */

    private function getMaxElementSide(byWidth:Bool = true):Float {
        var maxSide:Float = 0;
        for (i in 0...container.numChildren) {
            var element:DisplayObject = container.getChildAt(i);
            var tmpSide:Float = byWidth ? LayoutUtils.getWidth(element) : LayoutUtils.getHeight(element);
            maxSide = tmpSide > maxSide ? tmpSide : maxSide;
        }
        return maxSide;
    }
}