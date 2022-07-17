class AddStatusesToPatients < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :status, :string, null: false, default: 'in_hospital'
  end
end
