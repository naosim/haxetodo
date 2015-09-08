package lib;
class Value<T> {
    public var value(default, null): T;
    public function new(value: T) {
        this.value = value;
    }
    public function getValue() {
        return value;
    }
}
