import Base: +, -, show
import Dates: value
import Printf: @printf

struct Clock
    minutes::Int
    Clock(minutes) = new(mod(minutes, 1440))
end

Clock(hours, minutes) = Clock(hours * 60 + minutes)

+(clock::Clock, minutes::Minute) = Clock(clock.minutes + value(minutes))
-(clock::Clock, minutes::Minute) = Clock(clock.minutes - value(minutes))
show(io::IO, clock::Clock) = @printf(io, "\"%.2i:%.2i\"", clock.minutes ÷ 60, mod(clock.minutes, 60))
