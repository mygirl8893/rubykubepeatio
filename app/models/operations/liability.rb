class Liability < ActiveRecord::Base
end

# == Schema Information
# Schema version: 20181105120211
#
# Table name: liabilities
#
#  id          :integer          not null, primary key
#  code        :integer          not null
#  currency_id :string(255)      not null
#  member_id   :integer          not null
#  ref_id      :integer          not null
#  ref_type    :string(255)      not null
#  type        :boolean          not null
#  value       :decimal(32, 16)  not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_liabilities_on_currency_id          (currency_id)
#  index_liabilities_on_member_id            (member_id)
#  index_liabilities_on_ref_type_and_ref_id  (ref_type,ref_id)
#  index_liabilities_on_type                 (type)
#
