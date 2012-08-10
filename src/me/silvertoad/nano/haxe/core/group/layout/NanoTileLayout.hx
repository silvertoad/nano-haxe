package me.silvertoad.nano.haxe.core.group.layout;

import me.silvertoad.nano.haxe.core.group.layout.align.NanoVerticalAlign;
import me.silvertoad.nano.haxe.core.group.layout.align.NanoHorizontalAlign;
import nme.display.DisplayObject;
import nme.errors.IllegalOperationError;
import nme.errors.ArgumentError;
import nme.errors.Error;
class NanoTileLayout extends NanoBaseLayout {

    private var _columnWidth:Float;
    private var _rowHeight:Float;
    private var _numColumn:Int;
    private var _numRow:Int;

    public function new() {
        super();
        _columnWidth = 0;
        _rowHeight = 0;
        _numRow = 0;
        _numColumn = 0;
    }

    override private function alignHorizontal() {
        var elementsWidth:Float = calculateMaxRowWidth();
        var prevElement:DisplayObject = null;
        var numRow:Int = this.numRow;
        var numColumn:Int = this.numColumn;
        for (row in 0...numRow) {
            for (col in 0...numColumn) {
                var elementIndex:Int = col + row * numColumn;
                if (elementIndex >= container.numChildren) break;

                var element:DisplayObject = container.getChildAt(elementIndex);
                if (prevElement == null) {
                    switch (horizontalAlign)
                    {
                        case NanoHorizontalAlign.LEFT:
                            element.x = paddingLeft;
                        case NanoHorizontalAlign.CENTER:
                            if (container.fixedWidth != 0) {
                                element.x = (container.fixedWidth - elementsWidth + paddingLeft - paddingRight) / 2;
                            }
                            else {
                                element.x = paddingLeft;
                            }
                        case NanoHorizontalAlign.RIGHT:
                            if (container.fixedWidth != 0) {
                                element.x = container.fixedWidth - elementsWidth - paddingRight;
                            }
                            else {
                                element.x = paddingLeft;
                            }
                    }
                }
                else {
                    var elementWidth:Float = (_columnWidth != 0) ? _columnWidth : getWidth(prevElement);
                    element.x = prevElement.x + elementWidth + gap;
                }
                prevElement = element;
            }
            prevElement = null;
        }

        container.setMeasureWidth(paddingLeft + elementsWidth + paddingRight);
    }

    override private function alignVertical() {
        var elementsHeight:Float = calculateMaxColumnHeight();
        var prevElement:DisplayObject = null;

        for (col in 0...numColumn) {
            for (row in 0...numRow) {
                var elementIndex:Int = row * numColumn + col;
                if (elementIndex >= container.numChildren) break;

                var element:DisplayObject = container.getChildAt(elementIndex);
                if (prevElement == null) {
                    switch (verticalAlign)
                    {
                        case NanoVerticalAlign.TOP:
                            element.y = paddingTop;
                        case NanoVerticalAlign.MIDDLE:
                            if (container.fixedHeight != 0) {
                                element.y = (container.fixedHeight - elementsHeight + paddingTop - paddingBottom) / 2;
                            }
                            else {
                                element.y = paddingTop;
                            }
                        case NanoVerticalAlign.BOTTOM:
                            if (container.fixedHeight != 0) {
                                element.y = container.fixedHeight - elementsHeight - paddingBottom;
                            }
                            else {
                                element.y = paddingTop;
                            }
                    }
                }
                else {
                    var elementHeight:Float = (_rowHeight != 0) ? _rowHeight : getHeight(prevElement);
                    element.y = prevElement.y + elementHeight + gap;
                }
                prevElement = element;
            }
            prevElement = null;
        }

        container.setMeasureHeight(paddingTop + elementsHeight + paddingBottom);
    }

    private function calculateMaxRowWidth():Float {
        if (_columnWidth != 0) return _columnWidth * numColumn;

        var tmpElementWidth:Float = -gap;
        var elementsHeight:Float = 0;
        for (row in 0...numRow) {
            for (col in 0...numColumn) {
                var elementIndex:Int = col * numRow + row;
                if (elementIndex >= container.numChildren) break;

                var e:DisplayObject = container.getChildAt(elementIndex);
                tmpElementWidth += (getWidth(e) + gap);
            }
            elementsHeight = Math.max(elementsHeight, tmpElementWidth);
            tmpElementWidth = -gap;
        }

        return Math.max(elementsHeight, tmpElementWidth);
    }

    private function calculateMaxColumnHeight():Float {
        if (_rowHeight != 0) return _rowHeight * numRow;

        var tmpElementHeight:Float = -gap;
        var elementsHeight:Float = 0;
        for (col in 0...numColumn) {
            for (row in 0...numRow) {
                var elementIndex:Int = row * numColumn + col;
                if (elementIndex >= container.numChildren) break;

                var e:DisplayObject = container.getChildAt(elementIndex);
                tmpElementHeight += (getHeight(e) + gap);
            }
            elementsHeight = Math.max(elementsHeight, tmpElementHeight);
            tmpElementHeight = -gap;
        }

        return Math.max(elementsHeight, tmpElementHeight);
    }

    public var numColumn(_getNumColumn, _setNumColumn):Int;

    private function _getNumColumn():Int {
        if (_numColumn == 0) return calculateSide(_numRow);
        return _numColumn;
    }

    private function _setNumColumn(value:Int):Int {
        if (_numRow != 0) throw new IllegalOperationError("Property numRow already specified! You can specify only one of variables: numColumn or numRow.");
        return _numColumn = value;
    }

    public var numRow(_getNumRow, _setNumRow):Int;

    private function _getNumRow():Int {
        if (_numRow == 0) return calculateSide(_numColumn, false);
        return _numRow;
    }

    private function _setNumRow(value:Int):Int {
        if (_numColumn != 0) throw new IllegalOperationError("Property numColumn already specified! You can specify only one of variables: numColumn or numRow.");
        return _numRow = value;
    }

    private function calculateSide(anotherSide:Int, ?useTileEnd:Bool = true):Int {
        var tileEnd:Int;
        if (anotherSide != 0) {
            tileEnd = ((container.numChildren % anotherSide) != 0) ? 1 : 0;
            return Std.int(container.numChildren / anotherSide) + tileEnd;
        } else {
            var side:Int = Std.int(Math.sqrt(container.numChildren));
            tileEnd = ((container.numChildren % side) != 0) ? 1 : 0;
            tileEnd = useTileEnd ? tileEnd : 0;
            return side + tileEnd;
        }
    }

    //                    __
    //.-----.--.--.-----.|  |_.---.-.--.--.    .-----.--.--.-----.---.-.----.
    //|__ --|  |  |     ||   _|  _  |_   _|    |__ --|  |  |  _  |  _  |   _|
    //|_____|___  |__|__||____|___._|__.__|    |_____|_____|___  |___._|__|
    //      |_____|                                        |_____|

    public function suNumColumn(value:Int):NanoTileLayout {
        numColumn = value;
        return this;
    }

    public function suNumRow(value:Int):NanoTileLayout {
        numRow = value;
        return this;
    }

    public function suColumnWidth(value:Float):NanoTileLayout {
        _columnWidth = value;
        return this;
    }

    public function suRowWidth(value:Float):NanoTileLayout {
        _rowHeight = value;
        return this;
    }
}
