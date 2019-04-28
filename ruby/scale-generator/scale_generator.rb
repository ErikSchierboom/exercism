class Scale
  def initialize(tonic, type, intervals = CHROMATIC_SCALE_INTERVALS)
    @tonic = tonic
    @type = type
    @intervals = intervals
  end

  def name
    "#{tonic.capitalize} #{type}"
  end

  def pitches
    tonic_index = scale_for_tonic.index(tonic.capitalize)
    rotated_scale = scale_for_tonic.rotate(tonic_index)
    interval_indices.collect { |index| rotated_scale[index] }
  end

  private

  attr_reader :tonic, :type, :intervals

  def scale_for_tonic
    FLAT_KEYS.include?(tonic) ? CHROMATIC_SCALE_FLATS : CHROMATIC_SCALE_SHARPS
  end

  def interval_indices
    intervals[0..-2].each_char.each_with_object([0]) do |interval, indices|
      indices << indices.last + INTERVALS[interval]
    end
  end

  CHROMATIC_SCALE_SHARPS = %w[C C# D D# E F F# G G# A A# B].freeze
  CHROMATIC_SCALE_FLATS = %w[C Db D Eb E F Gb G Ab A Bb B].freeze
  FLAT_KEYS = %w(F Bb Eb Ab Db Gb d g c f bb eb).freeze
  INTERVALS = { 'm' => 1, 'M' => 2, 'A' => 3}.freeze
  MINOR_SCALE_INTERVALS = 'MmMMmMM'.freeze
  MAJOR_SCALE_INTERVALS = 'MMmMMMm'.freeze
  CHROMATIC_SCALE_INTERVALS = 'mmmmmmmmmmmm'.freeze
  private_constant :CHROMATIC_SCALE_SHARPS, :CHROMATIC_SCALE_FLATS, :FLAT_KEYS, :INTERVALS, :CHROMATIC_SCALE_INTERVALS
end