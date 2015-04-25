module Paperclip
  module Meta

    class ProcessMetaService

      def self.process!(logger = nil)
        class_names = ENV['CLASSES'] || ENV['classes'] || ""
        classes = class_names.split(',').map { |class_name| Paperclip.class_for(class_name) }
        self.new(logger).process!(*classes)
      end

      attr_accessor :logger

      def initialize(logger = nil)
        @logger = logger
      end

      def process!(*classes)
        classes.each do |klass|
          process_class(klass)
        end
      end

      private

      def process_class(klass)
        attachments = Paperclip::AttachmentRegistry.names_for(klass)
        raise "Class #{klass.name} has no attachments specified" if attachments.empty?

        klass.unscoped.each do |instance|
          log("Processing image meta data for #{instance.class}.#{instance.id}")
          attachments.each do |attachment_name|
            next if instance.send(attachment_name).blank?
            process_attachment(instance, attachment_name)
          end
        end
      end

      def process_attachment(instance, attachment_name)
        meta_attribute_name = "#{attachment_name}_meta"
        return unless instance.respond_to?(meta_attribute_name)

        attachment = instance.send(attachment_name)
        io_hash = attachment_styles_to_io_adapters(attachment)
        attachment.process_meta_for_styles(io_hash)
        if instance.respond_to?(:update_column)
          instance.update_column(meta_attribute_name, instance.send(meta_attribute_name))
        elsif instance.respond_to?(:update_attribute)
          instance.update_attribute(meta_attribute_name, instance.send(meta_attribute_name))
        end
      end

      def attachment_styles_to_io_adapters(attachment)
        io_hash = attachment.styles.reduce({}) do |hash, (style_name, style)|
          hash[style_name] = Paperclip.io_adapters.for(style)
          hash
        end

        unless io_hash.has_key?(:original)
          io_hash[:original] = Paperclip.io_adapters.for(attachment)
        end

        io_hash
      end

      def log(*args)
        logger.info(*args) if logger
      end

    end
  end
end