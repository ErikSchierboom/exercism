require 'benchmark'
require 'set'

n = 50_000

def random_name
  format('%c%c%03d', rand(65..91), rand(65..91), rand(100))
end

random_names_set = Enumerator.new do |y|
  used_names = Set.new

  loop do
    new_name = loop do
      name = random_name
      break name unless used_names.include?(name)
    end

    used_names << new_name
    y << new_name
  end
end

random_names_hash = Enumerator.new do |y|
  used_names = Hash.new(false)

  loop do
    new_name = loop do
      name = random_name
      break name unless used_names.key?(name)
    end

    used_names[new_name] = true
    y << new_name
  end
end


Benchmark.bm do |benchmark|
  benchmark.report('set') do
    n.times do
      random_names_set.next
    end
  end

  benchmark.report('hash') do
    n.times do
      random_names_hash.next
    end
  end
end