class AddTypeToTeas < ActiveRecord::Migration[7.1]
  def change
    add_column :teas, :type, :string
  end
end
