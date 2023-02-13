class CashRegister
    attr_accessor :total, :employee_discount, :items
  
    def initialize(employee_discount=0)
      @total = 0
      @employee_discount = employee_discount
      @items = []
    end
  
    def add_item(title, price, quantity=1)
      @total += price * quantity
      quantity.times { @items << title }
    end
  
    def apply_discount
      if @employee_discount > 0
        @total = @total * (100 - @employee_discount) / 100
        "After the discount, the total comes to $#{@total}."
      else
        "There is no discount to apply."
      end
    end
  
    def items(title=nil, quantity=nil)
      if title && quantity
        @items.select { |item| item == title }.take(quantity)
      else
        @items.dup
      end
    end
  
    def void_last_transaction
      @total = 0
    end
  end
  