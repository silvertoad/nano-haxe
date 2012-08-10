package me.silvertoad.nano.haxe.core.group;
import me.silvertoad.nano.haxe.core.group.layout.align.NanoVerticalAlign;
import me.silvertoad.nano.haxe.core.group.layout.align.NanoHorizontalAlign;
import me.silvertoad.nano.haxe.core.group.layout.INanoLayout;
import nme.display.DisplayObject;

/**
* Интерфейс для контейнера фрэймворка
*/
interface INanoGroup {
    /**
    * Класс выравнивание для этой группы
    */
    var layout(default, _setLayout):INanoLayout;

    /**
    * Фиусированная высота группы (данное число всегда будет возвращаться в свойстве height)
    */
    var fixedHeight(default, null):Float;

    /**
    * Фиксированная ширина группы (данное число всегда будет возвращаться в свойстве width)
    */
    var fixedWidth(default, null):Float;

    /**
    * Ширина группы.
    * Возвращает _fixedWidth, если данный параметр задан, иначе
    * возвращает _measureWidth, если данный параметр задан, иначе
    * возвращает super.width
    */
    var nWidth(_getWidth, _setWidth):Float;

    /**
    * Высота группы.
    * Возвращает _fixedHeight, если данный параметр задан, иначе
    * возвращает _measureHeight, если данный параметр задан, иначе
    * возвращает super.height
    */
    var nHeight(_getHeight, _setHeight):Float;

    /**
    * Установить рассчетную высоту компонента
    */
    function setMeasureHeight(measureHeight:Float):Void;

    /**
    * Установить рассчетную ширину компонента
    */
    function setMeasureWidth(measureWidth:Float):Void;

    /**
    * Добавить визульный компонет element в группу
    * @param element
    * @return ссылка на данную группу, для добавления по цепочке
    */
    function add(element:DisplayObject):INanoGroup;

    /**
    * Добавить визуальный компонент element в группу с нижестояшим индексом index
    * @param element
    * @param index
    * @return ссылка на данную группу, для добавления по цепочке
    */
    function addAt(element:DisplayObject, index:Int):INanoGroup;

    /**
    * Произвести выравнивание элементов группы
    * @return ссылка на данную группу
    */
    function build():DisplayObject;

    /**
    * Вернуть ссылку на самого себя в качестве DisplayObject (если build делать рано)
    * @return
    */
    function end():DisplayObject;

    /**
    * Удалить визуальный компонент element из группы
    * @param element
    * @return удаленный визуальный компонент element
    */
    function remove(element:DisplayObject):DisplayObject;

    /**
    * Удалить визуальный компонент под индексом index из группы
    * @param index
    * @return удаленный визуальный компонент под индексом index
    */
    function removeAt(index:Int):DisplayObject;

    function suGap(value:Float):INanoGroup;

    function suPadLeft(value:Float):INanoGroup;

    function suPadRight(value:Float):INanoGroup;

    function suPadTop(value:Float):INanoGroup;

    function suPadBottom(value:Float):INanoGroup;

    function suHAlign(value:NanoHorizontalAlign):INanoGroup;

    function suVAlign(value:NanoVerticalAlign):INanoGroup;

    function suWidth(value:Float):INanoGroup;

    function suHeight(value:Float):INanoGroup;

    function suX(value:Float):INanoGroup;

    function suY(value:Float):INanoGroup;
}