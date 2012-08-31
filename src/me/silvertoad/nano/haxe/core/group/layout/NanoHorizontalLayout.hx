package me.silvertoad.nano.haxe.core.group.layout;

import me.silvertoad.nano.haxe.utils.LayoutUtils;
import nme.display.DisplayObject;
import me.silvertoad.nano.haxe.utils.LayoutUtils;
import me.silvertoad.nano.haxe.core.group.layout.align.NanoHorizontalAlign;

class NanoHorizontalLayout extends NanoBaseLayout {
    public function new(?gap:Float = 10) {
        super();
        this.gap = gap;
    }

    override private function alignHorizontal() {
        var prevElement:DisplayObject = null;
        var element:DisplayObject;

        // Считаем щирину всех элеметнов (без отступов)
        var elementsWidth:Float = -gap;
        for (j in 0...container.numChildren) {
            element = container.getChildAt(j);
            elementsWidth += (LayoutUtils.getWidth(element) + gap);
        }

        for (i in 0...container.numChildren) {
            element = container.getChildAt(i);
            if (prevElement == null) {
                switch (horizontalAlign) {
                    case NanoHorizontalAlign.LEFT:
                        element.x = paddingLeft;
                    case NanoHorizontalAlign.CENTER:
                        if (container.fixedWidth != 0) {
                            element.x = (container.fixedWidth - elementsWidth + paddingLeft - paddingRight) / 2;
                        } else {
                            element.x = paddingLeft;
                        }
                    case NanoHorizontalAlign.RIGHT:
                        if (container.fixedWidth != 0) {
                            element.x = container.fixedWidth - elementsWidth - paddingRight;
                        } else {
                            element.x = paddingLeft;
                        }
                }
            } else {
                element.x = prevElement.x + LayoutUtils.getWidth(prevElement) + gap;
            }
            prevElement = element;
        }

        container.setMeasureWidth(paddingLeft + elementsWidth + paddingRight);
    }
}
