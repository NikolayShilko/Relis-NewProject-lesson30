class NameOfBarbers < ActiveRecord::Migration[6.1]
  def change
      create_table :barbers do |t|
  		t.text :name


        t.timestamps
    end
    Barber.create :name=> 'Алексей Кукушкин'
    Barber.create :name=> 'Илья Сорокин'
  end
end
