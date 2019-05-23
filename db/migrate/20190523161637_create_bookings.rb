class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.jsonb :payment
      t.string :state
      t.references :plan, foreign_key: true
      t.monetize :amount

      t.timestamps
    end
  end
end
