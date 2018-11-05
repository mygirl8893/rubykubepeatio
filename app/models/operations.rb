# frozen_string_literal: true

# Provides models and errors for the ::AccountingService.
module Operations
  # {Operations::Base} provides generic methods for the accounting operations
  # models.
  # @abstract
  class Base < ActiveRecord::Base
    self.abstract_class = true

    belongs_to :ref, polymorphic: true
    belongs_to :currency, foreign_key: :currency_id

    before_create do
      self.currency = ref.currency
    end

    # @!attribute [r] type
    #   @return [Symbol] Operation type. Can be `:debit` or `:credit`.
    enum type: %i[debit credit]

    # Create an operation for a reference
    def self.create_from(ref)
      create(ref: ref)
    end
  end
end
