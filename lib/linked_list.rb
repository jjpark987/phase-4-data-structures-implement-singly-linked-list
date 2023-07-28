require_relative './node'

class LinkedList
    attr_accessor :head

    def initialize
        @head = nil
    end

    def prepend node
        node.next_node = @head
        @head = node
    end

    def append node
        if !@head
            return @head = node
        end

        last_node = @head

        while last_node.next_node
            last_node = last_node.next_node
        end

        last_node.next_node = node
    end

    def delete_head
        if !@head || !@head.next_node
            return @head = nil
        end

        @head = @head.next_node
    end

    def delete_tail
        if !@head || !@head.next_node
            return @head = nil
        end

        second_to_last = @head

        while second_to_last.next_node&.next_node
            second_to_last = second_to_last.next_node
        end

        second_to_last.next_node = nil
    end

    def add_after index, node
        current_node = @head
        current_index = 0

        while current_index < index
            current_node = current_node.next_node
            current_index += 1
        end

        if !current_node
            append node
        elsif current_node&.next_node
            node.next_node = current_node.next_node
            current_node.next_node = node
        else
            current_node.next_node = node
        end
    end

    def search value
        node = @head

        until node.data == value
            node = node.next_node
        end

        node
    end
end
