class AddReferencesToShetts < ActiveRecord::Migration[6.1]
  def change
    add_reference :sheets, :screen, foreign_key: true
  end
end
