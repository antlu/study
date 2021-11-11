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

      def out_of_bounds?(array, item)
        item < array.first || item > array.last
      end

      def search(array, item, left_bound_index = 0, right_bound_index = array.size - 1)
        return -1 if left_bound_index > right_bound_index || out_of_bounds?(array, item)

        middle_item_index = (left_bound_index + right_bound_index) / 2
        middle_item = array[middle_item_index]

        return middle_item_index if item == middle_item

        item > middle_item ? search(array, item, middle_item_index + 1, right_bound_index) : search(array, item, left_bound_index, middle_item_index - 1)
      end
    end
  end
end
