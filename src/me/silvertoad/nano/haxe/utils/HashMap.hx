package me.silvertoad.nano.haxe.utils;
class HashMap<K, V> {
    private var _hash:Hash<V>;

    public function new() {
        _hash = new Hash<V>();
    }

    public function put(key:K, value:V):HashMap<K, V> {
        _hash.set(getKey(key), value);
        return this;
    }

    private function getKey(key:K):String {
        return Std.string(key);
    }

    public function get(key:K):V {
        return _hash.get(getKey(key));
    }

    public static function create<K, V>():HashMap<K, V> {
        return new HashMap();
    }
}
