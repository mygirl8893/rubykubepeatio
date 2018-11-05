# encoding: UTF-8
# frozen_string_literal: true

describe AccountingService do
  subject { AccountingService.create_deposit(deposit) }
  # 1. Create Asset for coin or fiat (credit), code: 102/101
  # 2. Create main Liability for coin or fiat (credit), code: 202/201
  subject { AccountingService.create_withdraw(withdraw) }
  # 1. Create Expense for blockchain fees (credit), code: 542
  # 2. Create Revenues for platform withdraw fees (credit), code: ???
  # This two operations need to discuss (1, 2)
  # 3. Create Asset for minus funds (debit), code: 102/101
  # 4. Create main Liability for minus funds (debit), code: 201/202
  subject { AccountingService.create_order(order) }
  # 1. Create locked Liability for plus locked funds  (credit), code: 212
  # 2. Create main Liability for minus funds fot locking (debit), code: 202
  subject { AccountingService.create_trade(trade) }
  # 1. Create main Liability for plus funds after trade (credit), code: 202
  # 2. Create Revenues for trading fees income (credit), code: 410
  # 3. Create locked Liability for minus unlock funds (debit), code: 212
end