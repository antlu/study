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
        iter = lambda do |result, (head, *tail)|
          return block.call(result, head) if tail.empty?

          return iter.call(block.call(result, head), tail)
        end

        iter.call(start_value || first, start_value.nil? ? self[1..] : self)
      end
    end
  end
end
