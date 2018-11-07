# frozen_string_literal: true

<<<<<<< HEAD
describe AccountingService do

  # 1. Create Asset for coin or fiat (credit), code: 102/101
  # 2. Create main Liability for coin or fiat (credit), code: 202/201
  subject { AccountingService.create_deposit(deposit) }
  context 'when creating deposit' do
    pp subject
  end

  # 1. Create Expense for blockchain fees (credit), code: 542
  # 2. Create Revenues for platform withdraw fees (credit), code: ???
  #    This two operations need to discuss (1, 2)
  # 3. Create Asset for minus funds (debit), code: 102/101
  # 4. Create main Liability for minus funds (debit), code: 201/202
  subject { AccountingService.create_withdraw(withdraw) }
  context 'when creating withdraw' do
    pp subject
  end

  subject { AccountingService.create_order(order) }
  # 1. Create locked Liability for plus locked funds  (credit), code: 212
  # 2. Create main Liability for minus funds fot locking (debit), code: 202

  subject { AccountingService.create_trade(trade) }
  # 1. Create main Liability for plus funds after trade (credit), code: 202
  # 2. Create Revenues for trading fees income (credit), code: 410
  # 3. Create locked Liability for minus unlock funds (debit), code: 212

=======

describe AccountingService do

  let(:member) { create(:member) }
  let(:amount) { 100.to_d }
  let(:deposit) { create(:deposit_bct, member: member, amount: amount, currency: currency) }
  let(:currency) { Currency.find(:btc) }

  # 1. Create Asset for coin or fiat (credit), code: 102/101
  # 2. Create main Liability for coin or fiat (credit), code: 202/201
  subject { AccountingService.record_deposit(deposit) }

  it 'create asset and liability records' do
    # Check credit Asset and Liability for subject
  end
>>>>>>> Add new tables assets, expenses, revenues, liabilities and spec for them
end
