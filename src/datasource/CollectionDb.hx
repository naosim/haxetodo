package datasource;
// https://github.com/dkraczkowski/collection.js
interface CollectionDb<T> {
    function save(record: T): Void;
    function find(filter: T -> Bool, ?sort:T -> T -> Int): Array<T>;
}
