class HashSet
    attr_reader :max, :store

    def initialize(max)
        @max = max
        @store = Array.new(max) {Array.new}
    end
    
    def [](num)
        idx = num.hash % size
        @store[idx]
    end

    def insert(num)
        self.resize if @store.length == count + 1
        self[num] << num
    end


    def include?(num)
        self[num].include?(num)
    end

    def remove(num)
        self[num].delete(num) if self.include?(num)
    end

    def size
        @store.length
    end

    def count
        sum = 0
        @store.each {|sub| sum += sub.count}
        sum
    end

    def resize
        elements = [] 
        @store.each do |sub|
            sub.each {|ele| elements << ele}
        end
        @store = Array.new(@store.length * 2) {Array.new}
        elements.each {|ele| insert(ele)}
    end
end