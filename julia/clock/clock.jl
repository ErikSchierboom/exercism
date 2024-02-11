import Base: +, -, show
import Printf: @printf

struct Clock
    hours::Int
    minutes::Int
    Clock(hours, minutes) = new(div(mod(hours * 60 + minutes, 1440), 60), mod(minutes, 60))
end

+(clock::Clock, minutes::Minute) = Clock(clock.hours, clock.minutes + minutes.value)
-(clock::Clock, minutes::Minute) = Clock(clock.hours, clock.minutes - minutes.value)
show(io::IO, clock::Clock) = @printf(io, "\"%.2i:%.2i\"", clock.hours, clock.minutes)
