class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string  :issuer
      t.string  :recipient
      t.string  :description
      t.date    :date
      t.integer :tax
      t.integer :subtotal
      t.integer :total

      t.timestamps
    end
  end
end
