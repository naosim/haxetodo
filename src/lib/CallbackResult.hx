package lib;
class CallbackResult<C> {
    public var callback: Error -> C -> Void;
    public function new(callback: Error -> C -> Void) {
        this.callback;
    }
}

