require "pry"

class CashRegister
    def initialize(discount=nil,total=0)
        @discount = discount
        @total = total
        @items = []
    end

    attr_accessor :total, :discount, :price, :title

    def add_item(title, price,quantity=1)
        @price = price
        @quantity = quantity
        self.total += price*quantity
        quantity.times do
            self.items.push(title)
        end
    end

    def apply_discount
        if @discount
            self.total -= self.total*(@discount.to_f/100.0)
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        self.total -= @price*@quantity
    end
end


