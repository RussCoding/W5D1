class MaxIntSet
    attr_accessor :store
    attr_reader :max
    def initialize(max)
        @max = max
        @store = Array.new(max, false)
    end

    def insert(num)
        raise "Out of Bounds" if num < 0 || num > max-1
        store[num] = true
    end

    def remove(num)
        raise "Out of Bounds" if num < 0 || num > max-1
        store[num] = false
    end

    def include?(num)
        raise "Out of Bounds" if num < 0 || num > max-1
        store[num]
    end

end