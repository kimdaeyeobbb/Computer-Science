const tuple = ['tesla', 'model 3', 'model X', 'model Y'] as const;
console.log(typeof tuple);


type TupleToObject<T extends readonly (string| number|symbol)[]> = {
    [P in keyof T] : P
}

type result = TupleToObject<typeof tuple>;