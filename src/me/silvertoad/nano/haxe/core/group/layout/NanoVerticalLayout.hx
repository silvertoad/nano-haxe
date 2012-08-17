package me.silvertoad.nano.haxe.core.group.layout;

import me.silvertoad.nano.haxe.utils.LayoutUtils;
import nme.display.DisplayObject;
import me.silvertoad.nano.haxe.utils.LayoutUtils;
import me.silvertoad.nano.haxe.core.group.layout.align.NanoVerticalAlign;

class NanoVerticalLayout extends NanoBaseLayout {

    public function new(?gap:Float = 10) {
        super();
        this.gap = gap;
    }

    override private function alignVertical() {
        var prevElement:DisplayObject = null;
        var element:DisplayObject;

        // Считаем щирину всех элеметнов (без отступов)
        var elementsHeight:Float = -gap;
        for (j in 0...container.numChildren) {
            element = container.getChildAt(j);
            elementsHeight += (LayoutUtils.getHeight(element) + gap);
        }

        for (i in 0...container.numChildren) {
            element = container.getChildAt(i);
            if (prevElement == null) {
                switch (verticalAlign) {
                    case NanoVerticalAlign.TOP:
                        element.y = paddingTop;
                    case NanoVerticalAlign.MIDDLE:
                        if (container.fixedHeight != 0) {
                            element.y = (container.fixedHeight - elementsHeight + paddingTop - paddingBottom) / 2;
                        } else {
                            element.y = paddingTop;
                        }
                    case NanoVerticalAlign.BOTTOM:
                        if (container.fixedHeight != 0) {
                            element.y = container.fixedHeight - elementsHeight - paddingBottom;
                        } else {
                            element.y = paddingTop;
                        }
                }
            } else {
                element.y = prevElement.y + LayoutUtils.getHeight(prevElement) + gap;
            }
            prevElement = element;
        }

        container.setMeasureHeight(paddingTop + elementsHeight + paddingBottom);
    }
}