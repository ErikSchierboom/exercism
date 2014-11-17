module LeapYear

type LeapYear() = 
    static member isLeap (n: int) = n % 4 = 0 && (n % 400 = 0 || n % 100 <> 0)