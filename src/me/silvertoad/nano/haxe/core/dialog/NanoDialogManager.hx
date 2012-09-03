package me.silvertoad.nano.haxe.core.dialog;

import nme.errors.ArgumentError;
import nme.display.Sprite;
import nme.ui.Keyboard;
import nme.display.DisplayObject;
import me.silvertoad.nano.haxe.core.event.NanoDialogEvent;
import nme.events.KeyboardEvent;
import nme.display.Stage;

class NanoDialogManager {

    /**
     * Ссылка на Stage приложения, куда будут добавляться диалоги
     */
    private var _stage:Stage;

    /**
     * Список диалогов
     */
    private var _dialogs:Array<INanoDialog>;

    /**
     * Конструктор класса, кэширует Stage на который будут добавляться диалоги
     * @param topView
     */
    public function new(topView:Stage) {
        _stage = topView;
        _stage.addEventListener(KeyboardEvent.KEY_UP, keyUpEventHandler);
        _dialogs = [];
    }

    /**
     * Обработчик события закрытия диалога
     * @param event
     */
    private function dialogCloseHandler(event:NanoDialogEvent):Void {
        event.dialog.removeEventListener(NanoDialogEvent.NANO_DIALOG_CLOSE, dialogCloseHandler);
        if (event.dialog.capture != null) removeCapture(event.dialog);
        _stage.removeChild(cast event.dialog);
        _dialogs.remove(event.dialog);
    }

    /**
     * Обработчик нажатия на клавиатуру. При нажатии ESC закрываем верхний диалог, если у того свойство
     * useKeyboard == true
     * @param event
     */
    private function keyUpEventHandler(event:KeyboardEvent):Void {
        if (event.keyCode == Keyboard.ESCAPE) {
            var dialog:INanoDialog = _dialogs.length != 0 ? _dialogs[_dialogs.length - 1] : null;
            var useKeyboard:Bool = (dialog != null) && dialog.useKeyboard;
            if (useKeyboard) closeDialog(dialog);
        }
    }

    /**
     * Удалить подложку диалога
     * @param dialog
     */
    private function removeCapture(dialog:INanoDialog):Void {
        _stage.removeChild(dialog.capture);
    }

    /**
     * Добавить подложку под диалог
     */
    private function addCapture():DisplayObject {
        var capture:Sprite = new Sprite();
        capture.graphics.beginFill(0x000000, 0.1);
        capture.graphics.drawRect(0, 0, _stage.stageWidth, _stage.stageHeight);
        capture.graphics.endFill();
        _stage.addChild(capture);
        return capture;
    }

    /**
     * Добавить диалог на Stage
     * @param dialog
     * @param isModal
     */
    private function addDialog(dialog:INanoDialog, isModal:Bool = true):Void {
        centerDialog(dialog);
        if (isModal) dialog.capture = addCapture();
        _stage.addChild(cast dialog);
    }

    /**
     * Находится ли диалог под контролем этого мэнеджера диалогов
     * @param dialog
     * @return
     */
    private function isInDialogs(dialog:INanoDialog):Bool {
        return Lambda.has(_dialogs, dialog);
    }

    /**
     * @inheritDoc
     */
    public function showDialog(dialog:INanoDialog, isModal:Bool = true, useKeyboard:Bool = true):INanoDialog {
        if (isInDialogs(dialog)) {
            throw new ArgumentError("Dialog " + dialog + " already at screen");
        }

        _dialogs.push(dialog);
        dialog.useKeyboard = useKeyboard;
        dialog.addEventListener(NanoDialogEvent.NANO_DIALOG_CLOSE, dialogCloseHandler);
        addDialog(dialog, isModal);
        centerDialog(dialog);
        return dialog;
    }

    /**
     * @inheritDoc
     */
    public function closeDialog(dialog:INanoDialog):Void {
        if (isInDialogs(dialog) == false) {
            throw new ArgumentError("Dialog " + dialog + " not belong to that manager");
        }
        dialog.close();
    }

    /**
     * @inheritDoc
     */
    public function findDialog(dialogClass:Class<Dynamic>):INanoDialog {
        var dialog:INanoDialog;
        for (dialog in _dialogs) {
            if (Std.is(dialog, dialogClass)) {
                return dialog;
            }
        }
        return null;
    }

    /**
     * @inheritDoc
     */
    public function centerDialog(dialog:INanoDialog):Void {
        dialog.nX = (_stage.stageWidth - dialog.nWidth) / 2;
        dialog.nY = (_stage.stageHeight - dialog.nHeight) / 2;
    }
}