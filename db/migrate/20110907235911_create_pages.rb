class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :pagename
      t.string :pagetitle
      t.text :pagebody
      t.string :password_digest
      t.boolean :pagesecured

      t.timestamps
    end
  end
end
