class AddAttributesToShows < ActiveRecord::Migration[5.1]
  def change
    add_column :shows, :venue_name, :text
    add_column :shows, :address, :text
    add_column :shows, :ticket_link, :text

    add_column :shows, :capacity, :integer
    add_column :shows, :ticket_scale, :text
    add_column :shows, :gross_potential, :integer

    add_column :shows, :start_time, :text
    add_column :shows, :set_length, :text
    add_column :shows, :num_of_shows, :integer
    add_column :shows, :other_acts, :text

    add_column :shows, :contract_due, :datetime
    add_column :shows, :deposit_due, :float
    add_column :shows, :deposit_received, :float

    add_column :shows, :fee, :float
    add_column :shows, :backend, :text
    add_column :shows, :hotel, :text
    add_column :shows, :ground, :text
    add_column :shows, :backline, :text

    add_column :shows, :promoter_name, :text
    add_column :shows, :promoter_phone, :text
    add_column :shows, :promoter_email, :text

    add_column :shows, :production_name, :text
    add_column :shows, :production_phone, :text
    add_column :shows, :production_email, :text

    add_column :shows, :announce, :datetime
    add_column :shows, :on_sale, :datetime

    add_column :shows, :end_date, :datetime

    remove_column :shows, :deal_id


  end
end
