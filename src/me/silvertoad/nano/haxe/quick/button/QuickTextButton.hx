package me.silvertoad.nano.haxe.quick.button;

import nme.text.TextFormatAlign;
import nme.text.TextFormat;
import nme.text.TextFieldAutoSize;
import nme.text.TextField;
import nme.events.Event;
import nme.events.MouseEvent;
import me.silvertoad.nano.haxe.core.button.NanoBaseButton;

class QuickTextButton extends QuickDisplayObjectButton {

    private var _textField:TextField;

    public function new() {
        super();
        _textField = new TextField();
        var format = new TextFormat();
        format.align = TextFormatAlign.CENTER;
        _textField.defaultTextFormat = format;
        _textField.autoSize = TextFieldAutoSize.LEFT;
        suDisplayObject(_textField);
    }

    public var text(default, _setText):String;

    private function _setText(text:String):String {
        _textField.text = text;
        trace(_textField.width);
        suDisplayObject(_textField);
        return this.text = text;
    }
}