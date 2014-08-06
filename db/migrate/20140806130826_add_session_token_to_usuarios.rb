class AddSessionTokenToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :session_token, :string
    add_index :usuarios, :session_token
  end
end
