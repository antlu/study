module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        iter = lambda do |(first, *rest)|
          yield first

          return if rest.empty?

          return iter.call(rest)
        end
        iter.call(self)
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
      def my_reduce(start_value = nil, &block)
        result = start_value || first
        array = start_value.nil? ? self[1..] : self
        array.my_each { |e| result = block.call(result, e) }
        result
      end
    end
  end
end
