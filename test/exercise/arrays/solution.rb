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
        bs_iter = lambda do |left_bound_index, right_bound_index|
          return -1 if array.empty? || left_bound_index > right_bound_index

          middle_item_index = (left_bound_index + right_bound_index) / 2
          middle_item = array[middle_item_index]

          return middle_item_index if item == middle_item

          left_bound_index = middle_item_index + 1 if item > middle_item
          right_bound_index = middle_item_index - 1 if item < middle_item

          return bs_iter.call(left_bound_index, right_bound_index)
        end

        bs_iter.call(0, array.size - 1)
      end
    end
  end
end
