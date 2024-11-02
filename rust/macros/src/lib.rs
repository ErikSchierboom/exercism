#[macro_export]
macro_rules! hashmap {
    ($($key:expr => $value:expr,)+) => { $crate::hashmap!($($key => $value),+) };
    ($($key:expr => $value:expr),*) => {
        {
            let mut _hm = ::std::collections::HashMap::new();
            $(
                _hm.insert($key, $value);
            )*
            _hm
        }
    };
}
