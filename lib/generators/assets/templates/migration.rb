class Create<%= table_name.camelize %> < ActiveRecord::Migration
  def self.up
    create_table(:<%= table_name %>) do |t|

<% for attribute in attributes -%>
      t.<%= attribute.type %> :<%= attribute.name %>
<% end -%>

      # setup polymorphic owner fields
      t.string :owner_type
      t.integer :owner_id

      # setup fields for paperclip 
      t.string :attachment_file_name, :attachment_content_type
      t.integer :attachment_file_size
      t.datetime :attachment_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :<%= table_name %>
  end
end
