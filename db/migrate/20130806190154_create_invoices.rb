class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string  :issuer
      t.string  :recipient
      t.string  :description
      t.date    :date
      t.integer :tax,      default: 0
      t.integer :subtotal, default: 0
      t.integer :total,    default: 0

      t.timestamps
    end
  end
end
