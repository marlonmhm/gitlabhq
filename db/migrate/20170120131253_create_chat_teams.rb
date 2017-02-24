class CreateChatTeams < ActiveRecord::Migration
  include Gitlab::Database::MigrationHelpers

  DOWNTIME = true
  DOWNTIME_REASON = "Adding a foreign key"

  def change
    create_table :chat_teams do |t|
      t.integer :namespace_id, index: true
      t.string :team_id
      t.string :name

      t.timestamps null: false
    end

    add_concurrent_foreign_key :chat_teams, :namespaces, on_delete: :cascade
  end
end
