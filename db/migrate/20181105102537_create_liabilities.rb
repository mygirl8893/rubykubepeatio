class CreateLiabilities < ActiveRecord::Migration
  def change
    create_table :liabilities do |t|
      t.integer     :code,        null: false
      t.string      :currency_id, null: false, index: true, foreign_key: true
      t.integer     :member_id,   null: false, index: true, foreign_key: true
      t.references  :ref,         null: false, index: true, polymorphic: true
      t.boolean     :type,        null: false, index: true
      t.decimal     :value,       null: false, precision: 32, scale: 16

      t.timestamps null: false
    end
  end
end
