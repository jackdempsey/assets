require 'rails/generators/active_record'
# generator borrows some nice methods and logic from devise
# http://github.com/plataformatec/devise

module Assets
  module Generators
    class ModelGenerator < ActiveRecord::Generators::Base
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"

      source_root File.expand_path("../templates", __FILE__)

      def generate_model
        invoke "active_record:model", [name], :migration => false unless model_exists?
      end

      def copy_migration
        migration_template "migration.rb", "db/migrate/create_#{table_name}"
      end

      def inject_content
        inject_into_class model_path, class_name, %q{
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :description, :owner_type, :owner_id, :attachment

  belongs_to :owner, :polymorphic => true

  validates_presence_of :owner

  has_attached_file :attachment

  %w(image doc pdf xls).each do |file_type|
    define_method "is_#{file_type}?" do
      attachment_content_type.present? && attachment_content_type.include?("#{file_type}")
    end
  end

}
      end

      private

      def model_exists?
        File.exists?(File.join(destination_root, model_path))
      end

      def model_path
        @model_path ||= File.join("app", "models", "#{file_path}.rb")
      end

    end
  end
end
