class CreateApiKeys < ActiveRecord::Migration[7.0]
  def change
    create_table :api_keys,
      comment: "Holds all API keys for access to the API"  do |t|

      t.text :key, null: false,
        comment: "The actual key clients should use"

      t.text :client_name, null: false,
        comment: "Name of the client who was assigned this key"

      t.datetime :deactivated_at, null: true,
        comment: "When the key was deactivated. " +
                 "When present, this key is not valid."
      
      t.timestamps

      # Note: No updated_at because there should be no updates
      #       to rows here other than to deactivate
    end

    # Cannot add a comment to individual column via `t.timestamps`
    change_column :api_keys, :created_at, :timestamp, precision: 6, comment: "When this key was created"

    add_index :api_keys, :key, unique: true,
      comment: "API keys have to be unique or we " +
               "don't know who is accessing us"

    add_index :api_keys, :client_name,
              unique: true,
              where: "deactivated_at IS NULL"
  end
end
