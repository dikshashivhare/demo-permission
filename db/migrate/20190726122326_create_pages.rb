class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :user_role
      t.string :page_name

      t.timestamps
    end
  end
end
