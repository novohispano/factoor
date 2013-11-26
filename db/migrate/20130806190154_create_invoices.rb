class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string  :issuer
      t.string  :recipient
      t.string  :description
      t.string  :invoice_type
      t.date    :date
      t.integer :tax,      default: 0
      t.integer :subtotal, default: 0
      t.integer :total,    default: 0
      t.integer :user_id
      t.integer :company_id

      t.timestamps
    end
  end
end
