class CreateAuthers < ActiveRecord::Migration[6.0]
  def change
    create_table :authers do |t|
      t.string :name
      t.string :penname

      t.timestamps
    end
  end
end
