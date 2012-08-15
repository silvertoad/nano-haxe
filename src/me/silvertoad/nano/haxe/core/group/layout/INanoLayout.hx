package me.silvertoad.nano.haxe.core.group.layout;
import me.silvertoad.nano.haxe.core.group.layout.align.NanoHorizontalAlign;
import me.silvertoad.nano.haxe.core.group.layout.align.NanoVerticalAlign;
import me.silvertoad.nano.haxe.core.group.NanoGroup;

interface INanoLayout {
    /**
    * Группа над которой будет работать INanoLayout
    */
    var container(default, default):NanoGroup;

    /**
    * Расстояние между элеентами
    */
    var gap(default, default):Float;

    /**
    * Отступ внутренных элементов слева
    */
    var paddingLeft(default, default):Float;

    /**
    * Отступ внутренных элеметнов справа
    */
    var paddingRight(default, default):Float;

    /**
    * Отступ внутренних элементов сверху
    */
    var paddingTop(default, default):Float;

    /**
    * Отступ внутренних элементов снизу
    */
    var paddingBottom(default, default):Float;

    /**
    * Вертикальное выраснивание элементов группы
    */
    var verticalAlign(default, default):NanoVerticalAlign;

    /**
    * Горизонтальное выравнивание элементов группы
    */
    var horizontalAlign(default, default):NanoHorizontalAlign;

    /**
    * Выравныть элементы группы
    */
    function realign():Void;
}