package lib;
class Entity<T, V> {
    public var id(default, null): T;
    var value: V;
    public function new(id: T, value: V) {
        this.id = id;
        this.value = value;
    }
}
