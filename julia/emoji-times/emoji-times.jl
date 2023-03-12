import Base: +, -

struct Clock
    minutes::Int
end

+(a::Clock, b::Clock) = Clock(mod(a.minutes + b.minutes, 720))
-(a::Clock, b::Clock) = Clock(mod(a.minutes - b.minutes, 720))

🕛 = Clock(0)
🕧 = Clock(30)
🕐 = Clock(60)
🕒 = Clock(180)
🕞 = Clock(210)
🕓 = Clock(240)
🕔 = Clock(300)
🕕 = Clock(360)
🕖 = Clock(420)
🕗 = Clock(480)
🕘 = Clock(540)
🕤 = Clock(570)
🕙 = Clock(600)
🕚 = Clock(660)
