class ResizingIntSet < IntSet
    def size
        @store.length
    end

    def count
        @store.flatten.count
    end

    def insert(num)
        self.resize if @store.length == count + 1
        self[num] << num
    end

    def resize
        elements = @store.flatten
        @store = Array.new(@store.length * 2) {Array.new}
        elements.each {|ele| insert(ele)}
    end
end
