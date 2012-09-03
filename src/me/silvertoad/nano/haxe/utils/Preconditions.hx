package me.silvertoad.nano.haxe.utils;
import nme.errors.ArgumentError;

class Preconditions {
    public static function checkNotNull(ref:Dynamic, ?message:String):Dynamic {
        if (ref == null)
            throw new ArgumentError(message != null ? message : "Null pointer exception!");
        return ref;
    }

    public static function checkState(expression:Bool, ?message:String):Void {
        if (!expression)
            throw new ArgumentError(message != null ? message : "Illegal state exception!");
    }
}
