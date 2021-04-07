class Statement
  def initialize
    @list = []
  end

  def list_transactions
    @list
  end

  def add_transaction(transaction)
    @list.push(transaction)
  end
end