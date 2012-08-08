package me.silvertoad.nano.haxe.core.group.layout;
import me.silvertoad.nano.haxe.core.group.INanoGroup;
import me.silvertoad.nano.haxe.core.group.layout.align.NanoVerticalAlign;
import me.silvertoad.nano.haxe.core.group.layout.align.NanoHorizontalAlign;
import nme.display.DisplayObject;
import me.silvertoad.nano.haxe.core.group.NanoGroup;
class NanoBaseLayout implements INanoLayout {

    public function new(paddingLeft:Float = 0, paddingRight:Float = 0, paddingTop:Float = 0, paddingBottom:Float = 0) {
        this.paddingLeft = paddingLeft;
        this.paddingRight = paddingRight;
        this.paddingTop = paddingTop;
        this.paddingBottom = paddingBottom;
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
            switch (verticalAlign) {
                case NanoVerticalAlign.TOP:
                    element.y = paddingTop;
                    break;
                case NanoVerticalAlign.MIDDLE:
                    if (container.fixedHeight != null) {
                        element.y = (container.fixedHeight - getHeight(element) + paddingTop - paddingBottom) / 2;
                    } else {
                        element.y = paddingTop + (maxHeight - getHeight(element)) / 2;
                    }
                    break;
                case NanoVerticalAlign.BOTTOM:
                    if (container.fixedHeight != null) {
                        element.y = container.fixedHeight - getHeight(element) - paddingBottom;
                    } else {
                        element.y = paddingTop + (maxHeight - getHeight(element));
                    }
                    break;
            }
        }

        container.setMeasureHeight(paddingTop + maxHeight + paddingBottom);
    }

/**
* Произвести выравнивание по горизонтали
*/

    private function alignHorizontal() {
        var maxWidth:Float = getMaxElementSide(true);

        trace(container.numChildren);
        for (i in 0...container.numChildren+1) {
            var element:DisplayObject = container.getChildAt(i);
            trace(i + " element");
            trace(horizontalAlign);
            switch (horizontalAlign) {
                case NanoHorizontalAlign.LEFT:
                    element.x = paddingLeft;
                    break;
                case NanoHorizontalAlign.CENTER:
                    if (container.fixedWidth != null) {
                        element.x = (container.fixedWidth - getWidth(element) + paddingLeft - paddingRight) / 2;
                    } else {
                        element.x = paddingLeft + (maxWidth - getWidth(element)) / 2;
                    }
                    break;
                case NanoHorizontalAlign.RIGHT:
                    if (container.fixedWidth != null) {
                        element.x = container.fixedWidth - getWidth(element) - paddingRight;
                    } else {
                        element.x = paddingLeft + (maxWidth - getWidth(element));
                    }
                    break;
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
            var tmpSide:Float = byWidth ? getWidth(element) : getHeight(element);
            maxSide = tmpSide > maxSide ? tmpSide : maxSide;
        }
        return maxSide;
    }

    private function getWidth(element:DisplayObject):Float {
        if (Std.is(element, INanoGroup)) {
            return cast(element, INanoGroup).nWidth;
        }
        return element.width;
    }

    private function getHeight(element:DisplayObject):Float {
        if (Std.is(element, INanoGroup)) {
            return cast(element, INanoGroup).nHeight;
        }
        return element.height;
    }
}