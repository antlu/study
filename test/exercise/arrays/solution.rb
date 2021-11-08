module Exercise
  module Arrays
    class << self
      def find_max(array)
        array.reduce { |max, item| max < item ? item : max }
      end

      def replace(array)
        return if array.empty?

        max = find_max(array)

        array.map { |item| item.positive? ? max : item }
      end

      def search(array, item)
        bs_iter = lambda do |array_slice, indexes|
          return -1 if array_slice.empty?

          middle_item_index = indexes.size / 2
          middle_item = array_slice[middle_item_index]

          return indexes[middle_item_index] if item == middle_item

          left_bound_index = 0
          right_bound_index = indexes[-1]
          return -1 if left_bound_index == right_bound_index

          if item > middle_item
            left_bound_index = middle_item_index + 1
          elsif item < middle_item
            right_bound_index = middle_item_index - 1
          end
          return bs_iter.call(
            array_slice[left_bound_index..right_bound_index],
            indexes[left_bound_index..right_bound_index]
          )
        end

        indexes = (0..array.size - 1).to_a
        bs_iter.call(array, indexes)
      end
    end
  end
end
