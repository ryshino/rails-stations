class AddReferencesTheatersToSheets < ActiveRecord::Migration[6.1]
  def change
    add_reference :sheets, :theater, foreign_key: true
  end
end
