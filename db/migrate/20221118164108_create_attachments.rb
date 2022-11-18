class CreateAttachments < ActiveRecord::Migration[7.0]
  def change
    create_table :attachments, force: :cascade do |t|
      t.references :attachable, polymorphic: true
      t.references :user, foreign_key: true
      t.string :file_file_name
      t.string :file_content_type
      t.integer :file_file_size
      t.string :name
      t.boolean :deletable, default: true
      t.integer :category
      t.string :file_path

      t.timestamps
    end
  end
end
