module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        first, *rest = self
        return if first.nil?

        yield first
        self.class.new(rest).my_each(&block)
        self
      end

      # Написать свою функцию my_map
      def my_map(&block)
        my_reduce(self.class.new) { |result, e| result << block.call(e) }
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(self.class.new) { |result, e| e.nil? ? result : result << e }
      end

      # Написать свою функцию my_reduce
      def my_reduce(result = nil, &block)
        array = result.nil? ? self[1..] : self
        return result if array.empty?

        new_result = result || first
        head, *tail = array
        self.class.new(tail).my_reduce(block.call(new_result, head), &block)
      end
    end
  end
end
