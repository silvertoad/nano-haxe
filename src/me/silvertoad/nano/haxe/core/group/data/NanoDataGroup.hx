package me.silvertoad.nano.haxe.core.group.data;

import nme.errors.Error;
import nme.events.MouseEvent;
import me.silvertoad.nano.haxe.utils.IDestroyable;
import me.silvertoad.nano.haxe.core.group.layout.INanoLayout;
import me.silvertoad.nano.haxe.core.group.data.renderer.INanoItemRenderer;
import me.silvertoad.nano.haxe.core.group.NanoGroup;
import nme.errors.ArgumentError;
import nme.display.DisplayObject;

class NanoDataGroup<T> extends NanoGroup {

    public function new(?layout:INanoLayout) {
        super(layout);
    }

    public var itemRenderer(default, default):Class<INanoItemRenderer<T>>;

    public var dataProvider(default, _setDataGroup):Array<T>;

    private function _setDataGroup(dataProvider:Array<T>):Array<T> {
        cleanGroup();
        for (i in 0...dataProvider.length) {
            var renderer:INanoItemRenderer<T> = getRendererInstance();
            renderer.setData(dataProvider[i]);
            var element:DisplayObject = cast renderer;
            add(element);
        }
        return this.dataProvider = dataProvider;
    }

    private function getRendererInstance():INanoItemRenderer<T> {
        if(itemRenderer == null) throw new Error("You must specify item renderer class!");
        var instance:INanoItemRenderer<T> = Type.createInstance(itemRenderer, []);
        if (!Std.is(instance, DisplayObject)) throw new ArgumentError("Item renderer has to be DisplayObject");
        return instance;
    }

    private function cleanGroup() {
        while (numChildren != 0) {
            var child:DisplayObject = removeAt(0);
            if (Std.is(child, IDestroyable)) cast(child, IDestroyable).destroy();
        }
    }
}
