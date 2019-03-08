require 'benchmark'

n = 50_000
chars = ('A'..'Z').to_a
digits = ('0' .. '9').to_a

Benchmark.bm do |benchmark|
  # benchmark.report('chars - join') do
  #   n.times do
  #     [rand(65..91).chr, rand(65..91).chr].join
  #   end
  # end
  #
  # benchmark.report('chars - concat') do
  #   n.times do
  #     rand(65..91).chr + rand(65..91).chr
  #   end
  # end
  #
  # benchmark.report('chars - sample') do
  #   n.times do
  #     chars.sample(2).join
  #   end
  # end
  #
  # benchmark.report('digits - join') do
  #   n.times do
  #     [rand(0..9), rand(0..9), rand(0..9)].join
  #   end
  # end
  #
  # benchmark.report('digits - rjust') do
  #   n.times do
  #     rand(100).to_s.rjust(3, '0')
  #   end
  # end
  #
  # benchmark.report('digits - format') do
  #   n.times do
  #     format('%03d', rand(100))
  #   end
  # end
  #
  # benchmark.report('digits - sample') do
  #   n.times do
  #     digits.sample(3).join
  #   end
  # end

  benchmark.report('combined - format chr') do
    n.times do
      format('%c%c%03d', rand(65..91).chr, rand(65..91).chr, rand(100))
    end
  end

  benchmark.report('combined - format') do
    n.times do
      format('%c%c%03d', rand(65..91), rand(65..91), rand(100))
    end
  end

  benchmark.report('combined - sample') do
    n.times do
      (chars.sample(2) + digits.sample(3)).join
    end
  end
end