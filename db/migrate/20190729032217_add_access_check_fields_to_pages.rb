class AddAccessCheckFieldsToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :access_to_employee, :boolean, default: false
    add_column :pages, :access_to_manager, :boolean, default: false
  end
end
