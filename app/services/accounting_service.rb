# frozen_string_literal: true

# AccountingService provides basic accounting tools.
#
module AccountingService
  # Takes a {::Deposit} and creates an operation for it.
  #
  # Here's it's basic flow:
  # 1. Create {Operations::Asset} for coin or fiat (*credit*), code: +102/101+
  # 2. Create main Liability for coin or fiat (*credit*), code: +202/201+
  def self.create_deposit(deposit)
    Operations::Asset.create_from(deposit)
  end

  # Takes a {::Withdraw} and creates an operation for it.
  #
  # 1. Create +Expense+ for blockchain fees (*credit*), code: +542+.
  # 2. Create +Revenues+ for platform withdraw fees (*credit*), code: ???.
  #    This two operations need to discuss (1, 2)
  # 3. Create +Asset+ for minus funds (*debit*), code: +102/101+.
  # 4. Create main +Liability+ for minus funds (*debit*), code: +201/202+.
  def self.create_withdraw(withdraw)
  end

  def self.create_order(order)
  end

  def self.create_trade(trade)
  end
end
