class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :name
      t.string   :email
      t.string   :image
      t.string   :location
      t.datetime :oath_expires_at
      t.string   :oauth_token
      t.string   :provider
      t.string   :uid

      t.timestamps
    end
  end
end
