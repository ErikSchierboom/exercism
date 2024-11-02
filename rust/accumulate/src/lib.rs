pub fn map<TIn, TOut>(input: Vec<TIn>, mut function: impl FnMut(TIn) -> TOut) -> Vec<TOut> {
    let mut mapped = Vec::with_capacity(input.len());

    for element in input {
        mapped.push(function(element));
    }

    mapped
}
