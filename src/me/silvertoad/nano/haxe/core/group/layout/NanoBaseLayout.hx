package me.silvertoad.nano.haxe.core.group.layout;
import me.silvertoad.nano.haxe.core.group.NanoGroup;
class NanoBaseLayout {

    private var _container:NanoGroup;

    public function new() {
    }

    public var container(_getContainer, _setContainer):NanoGroup;

    private function _getContainer():NanoGroup {
        return _container;
    }

    private function _setContainer(container:NanoGroup):NanoGroup {
        return _container = container;
    }
}