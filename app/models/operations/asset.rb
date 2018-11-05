# frozen_string_literal: true

module Operations
  # {Asset} is a balance sheet operation
  class Asset < Base
    # Permitted _account_ codes
    # TODO: remove this, just validate if a code is between 101 and 199
    # CODES = [101, 102].freeze

    # @!attribute [r] ref_type
    #   @return [Symbol] Operation reference type.
    # enum ref_type: %i[deposit withdraw]

    before_create do
      self.value = ref.amount

      # TODO: move to AccountingService
      self.code = currency.coin? ? 102 : 101

      self.type = case ref_type
                  when 'Deposit' then :credit
                  when 'Withdraw' then :debit
                  end

      pp self
    end
  end

  def type
    super ? :credit : :debit
  end
end

# == Schema Information
# Schema version: 20181105120211
#
# Table name: assets
#
#  id          :integer          not null, primary key
#  code        :integer          not null
#  currency_id :string(255)      not null
#  ref_id      :integer          not null
#  ref_type    :string(255)      not null
#  type        :boolean          not null
#  value       :decimal(32, 16)  not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_assets_on_currency_id          (currency_id)
#  index_assets_on_ref_type_and_ref_id  (ref_type,ref_id)
#  index_assets_on_type                 (type)
#
