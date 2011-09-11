class AddCopyrightToPages < ActiveRecord::Migration
  def change
    add_column :pages, :copyright, :string
  end
end
