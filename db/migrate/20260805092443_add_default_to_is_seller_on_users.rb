class AddDefaultToIsSellerOnUsers < ActiveRecord::Migration[8.1]
  def change
   change_column_default :users, :is_seller, from: nil, to: false 
  end
end
