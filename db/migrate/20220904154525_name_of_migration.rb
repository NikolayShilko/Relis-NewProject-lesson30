class NameOfMigration < ActiveRecord::Migration[6.1]
  def change
  	create_table :clients do |t|
  		t.text :name
        t.text :phone
        t.text :datestamp
        t.text :barber
        t.timestamps

    end
    Client.create :name=> 'Дарья Петрова'
  end
end
