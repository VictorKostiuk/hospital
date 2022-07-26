class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :patient
      t.string :title
      t.string :text

      t.timestamps
    end
  end
end
