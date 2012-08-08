package me.silvertoad.nano.haxe.core.group.layout;
import nme.display.DisplayObject;
import me.silvertoad.nano.haxe.core.group.NanoGroup;
class NanoBaseLayout implements INanoLayout {

    public function new(paddingLeft:Float = 0, paddingRight:Float = 0, paddingTop:Float = 0, paddingBottom:Float = 0) {
        this.paddingLeft = paddingLeft;
        this.paddingRight = paddingRight;
        this.paddingTop = paddingTop;
        this.paddingBottom = paddingBottom;
    }

    public var container(default, default):NanoGroup;
    public var gap(default, default):Float;
    public var paddingLeft(default, default):Float;
    public var paddingRight(default, default):Float;
    public var paddingTop(default, default):Float;
    public var paddingBottom(default, default):Float;
    public var verticalAlign(default, default):String;
    public var horizontalAlign(default, default):String;

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
            switch (_verticalAlign) {
                case NanoVerticalAlign.TOP:
                    element.y = paddingTop;
                    break;
                case NanoVerticalAlign.MIDDLE:
                    if (container.fixedHeight) {
//TODO: подумать, может быть сдесь стоит прибавить paddingTop и отнять paddingBottom
                        element.y = (container.fixedHeight - element.height + paddingTop - paddingBottom) / 2;
                    } else {
                        element.y = paddingTop + (maxHeight - element.height) / 2;
                    }
                    break;
                case NanoVerticalAlign.BOTTOM:
                    if (container.fixedHeight) {
                        element.y = container.fixedHeight - element.height - paddingBottom;
                    } else {
                        element.y = paddingTop + (maxHeight - element.height);
                    }
                    break;
            }
        }

        container.measureHeight = paddingTop + maxHeight + paddingBottom;
    }

/**
* Произвести выравнивание по горизонтали
*/

    private function alignHorizontal():void {
        var maxWidth:Float = getMaxElementSide(true);

        for (i in 0...container.numChildren) {
            var element:DisplayObject = container.getChildAt(i);
            switch (_horizontalAlign) {
                case NanoHorizontalAlign.LEFT:
                    element.x = paddingLeft;
                    break;
                case NanoHorizontalAlign.CENTER:
//TODO: подумать, может быть сдесь стоит прибавить paddingLeft и отнять paddingRight
                    if (container.fixedWidth) {
                        element.x = (container.fixedWidth - element.width + paddingLeft - paddingRight) / 2;
                    } else {
                        element.x = paddingLeft + (maxWidth - element.width) / 2;
                    }
                    break;
                case NanoHorizontalAlign.RIGHT:
                    if (container.fixedWidth) {
                        element.x = container.fixedWidth - element.width - paddingRight;
                    } else {
                        element.x = paddingLeft + (maxWidth - element.width);
                    }
                    break;
            }
        }

        container.measureWidth = paddingLeft + maxWidth + paddingRight;
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
            var tmpSide:Float = byWidth ? element.width : element.height;
            maxSide = tmpSide > maxSide ? tmpSide : maxSide;
        }
        return maxSide;
    }
}