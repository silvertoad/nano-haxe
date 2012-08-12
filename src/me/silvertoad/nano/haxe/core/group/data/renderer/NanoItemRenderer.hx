package me.silvertoad.nano.haxe.core.group.data.renderer;
import me.silvertoad.nano.haxe.core.group.layout.INanoLayout;
import me.silvertoad.nano.haxe.core.group.NanoGroup;
class NanoItemRenderer<T> extends NanoGroup, implements INanoItemRenderer<T> {

    private var _data:T;

    public function new(?layout:INanoLayout) {
        super(layout);
    }

    public function setData(data:T):Void {
        _data = data;
    }

    public function getData():T {
        return _data;
    }
}
