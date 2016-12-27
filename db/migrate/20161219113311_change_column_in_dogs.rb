class ChangeColumnInDogs < ActiveRecord::Migration
  def change
    change_column :dogs, :sex, :string, limit: 1
  end
end
