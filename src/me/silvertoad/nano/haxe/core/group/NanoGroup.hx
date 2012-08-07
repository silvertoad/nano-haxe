package me.silvertoad.nano.haxe.core.group;
import me.silvertoad.nano.haxe.core.group.layout.INanoLayout;
import nme.display.Sprite;

/**
 * Класс базового контейнера для выравнивания графических элементов
 */
class NanoGroup extends Sprite {

/**
* Конструктор класса, конфигурирующий группу экземпляром INanoLayout,
* layout по эмолчанию - NanoBaseLayout
* @param layout
*/
    public function new(?layout:INanoLayout) {
        super();
//        this.layout = layout ? layout : new NanoBaseLayout();
    }

    private var _layout:INanoLayout;

    private var _measureHeight:Float;

    private var _measureWidth:Float;

    private var _fixedWidth:Float;

    private var _fixedHeight:Float;

/**
* Класс выравнивание для этой группы
*/

    public function getLayout():INanoLayout {
        return _layout;
    }

///**
//* @private
//*/
//
//    public function set layout(value:INanoLayout):void {
//        if (_layout) _layout.container = null;
//        _layout = value;
//        _layout.container = this;
//    }
//
///**
//* Фиусированная высота группы (данное число всегда будет возвращаться в свойстве height)
//*/
//
//    public function get fixedHeight():Float {
//        return _fixedHeight;
//    }
//
///**
//* Фиксированная ширина группы (данное число всегда будет возвращаться в свойстве width)
//*/
//
//    public function get fixedWidth():Float {
//        return _fixedWidth;
//    }
//
///**
//* Установить рассчетную высоту компонента
//*/
//
//    public function set measureHeight(measureHeight:Float):void {
//        _measureHeight = measureHeight;
//    }
//
///**
//* Установить рассчетную ширину компонента
//*/
//
//    public function set measureWidth(measureWidth:Float):void {
//        _measureWidth = measureWidth;
//    }
//
///**
//* Вернуть ширину группы.
//* Возвращает _fixedWidth, если данный параметр задан, иначе
//* возвращает _measureWidth, если данный параметр задан, иначе
//* возвращает super.width
//*/
//
//    override public function get width():Float {
//        return _fixedWidth ? _fixedWidth : (_measureWidth ? _measureWidth : super.width);
//    }
//
///**
//* Установить фиксированную ширину группы
//*/
//
//    override public function set width(value:Float):void {
//        _fixedWidth = value;
//    }
//
///**
//* Вернуть высоту группы.
//* Возвращает _fixedHeight, если данный параметр задан, иначе
//* возвращает _measureHeight, если данный параметр задан, иначе
//* возвращает super.height
//*/
//
//    override public function get height():Float {
//        return _fixedHeight ? _fixedHeight : (_measureHeight ? _measureHeight : super.height);
//    }
//
///**
//* Установить фиксированную высоту группы
//*/
//
//    override public function set height(value:Float):void {
//        _fixedHeight = value;
//    }
//
//// ---------- public methods ----------
//
///**
//* Добавить визульный компонет element в группу
//* @param element
//* @return ссылка на данную группу, для добавления по цепочке
//*/
//
//    public function add(element:DisplayObject):NanoGroup {
//        return addAt(element, this.numChildren);
//    }
//
///**
//* Добавить визуальный компонент element в группу с нижестояшим индексом index
//* @param element
//* @param index
//* @return ссылка на данную группу, для добавления по цепочке
//*/
//
//    public function addAt(element:DisplayObject, index:int):NanoGroup {
//        this.addChildAt(element, index);
//        return this;
//    }
//
//    public function setAt(element:DisplayObject, x:Float = NaN, y:Float = NaN):NanoGroup {
//        if (!isNaN(x)) element.x = x;
//        if (!isNaN(y)) element.y = y;
//        return this;
//    }
//
///**
//* Произвести выравнивание элементов группы
//* @return ссылка на данную группу
//*/
//
//    public function build():NanoGroup {
//        layout.realign();
//        return this;
//    }
//
///**
//* Удалить визуальный компонент element из группы
//* @param element
//* @return удаленный визуальный компонент element
//*/
//
//    public function remove(element:DisplayObject):DisplayObject {
//        return removeAt(this.getChildIndex(element));
//    }
//
///**
//* Удалить визуальный компонент под индексом index из группы
//* @param index
//* @return удаленный визуальный компонент под индексом index
//*/
//
//    public function removeAt(index:int):DisplayObject {
//        return this.removeChildAt(index);
//    }
//
//// ---------- syntactic sugar ----------
//
//    public function suGap(value:Float):NanoGroup {
//        layout.gap = value;
//        return this;
//    }
//
//    public function suPadLeft(value:Float):NanoGroup {
//        layout.paddingLeft = value;
//        return this;
//    }
//
//    public function suPadRight(value:Float):NanoGroup {
//        layout.paddingRight = value;
//        return this;
//    }
//
//    public function suPadTop(value:Float):NanoGroup {
//        layout.paddingTop = value;
//        return this;
//    }
//
//    public function suPadBottom(value:Float):NanoGroup {
//        layout.paddingBottom = value;
//        return this;
//    }
//
//    public function suHAlign(value:String):NanoGroup {
//        layout.horizontalAlign = value;
//        return this;
//    }
//
//    public function suVAlign(value:String):NanoGroup {
//        layout.verticalAlign = value;
//        return this;
//    }
//
//    public function suWidth(value:Float):NanoGroup {
//        width = value;
//        return this;
//    }
//
//    public function suHeight(value:Float):NanoGroup {
//        height = value;
//        return this;
//    }
//
//    public function suX(value:Float):NanoGroup {
//        x = value;
//        return this;
//    }
//
//    public function suY(value:Float):NanoGroup {
//        y = value;
//        return this;
//    }
}
