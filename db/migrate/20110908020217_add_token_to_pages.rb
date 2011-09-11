class AddTokenToPages < ActiveRecord::Migration
  def change
    add_column :pages, :token, :string
  end
end
