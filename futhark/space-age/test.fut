import "space_age"

-- Age on Earth
-- ==
-- input { "Earth" 1000000000i64 }
-- output { 31.69 }

-- Age on Mercury
-- ==
-- input { "Mercury" 2134835688i64 }
-- output { 280.88 }

-- Age on Venus
-- ==
-- input { "Venus" 189839836i64 }
-- output { 9.78 }

-- Age on Mars
-- ==
-- input { "Mars" 2129871239i64 }
-- output { 35.88 }

-- Age on Jupiter
-- ==
-- input { "Jupiter" 901876382i64 }
-- output { 2.41 }

-- Age on Saturn
-- ==
-- input { "Saturn" 2000000000i64 }
-- output { 2.15 }

-- Age on Uranus
-- ==
-- input { "Uranus" 1210123456i64 }
-- output { 0.46 }

-- Age on Neptune
-- ==
-- input { "Neptune" 1821023456i64 }
-- output { 0.35 }

let main (planet: []u8) (seconds: i64): f64 =
  age planet seconds
