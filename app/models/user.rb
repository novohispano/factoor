class User < ActiveRecord::Base
  has_one  :company
  has_many :invoices
end