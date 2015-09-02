package lib;
class Entity<T, V> {
    public var id(default, null): T;
    public var value(default, null): V;
    public function new(id: T, value: V) {
        this.id = id;
        this.value = value;
    }
}
