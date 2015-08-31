package lib;
class Value<T> {
    var value: T;
    public function new(value: T) {
        this.value = value;
    }
    public function getValue() {
        return value;
    }
}
