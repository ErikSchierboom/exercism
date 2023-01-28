class BinarySearch
  def initialize(list) = @list = list

  def search_for(value)
    lower_idx = 0
    upper_idx = @list.size - 1

    while lower_idx <= upper_idx
      middle_idx = lower_idx + (upper_idx - lower_idx) / 2
      middle_value = @list[middle_idx]

      case value <=> middle_value
      when -1 then upper_idx = middle_idx - 1
      when  0 then return middle_idx
      when  1 then lower_idx = middle_idx + 1
      end
    end
  end
end
