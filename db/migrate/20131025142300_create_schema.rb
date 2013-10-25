class CreateSchema < ActiveRecord::Migration

  def change

    create_table :tasks do |column|
      column.string :title
      column.string :requirement
      column.boolean :completed, :default => false
      column.timestamps
    end

  end

end