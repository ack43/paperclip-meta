require 'paperclip/meta/process_meta_service'

namespace :paperclip_meta do

  desc 'Regenerate only the paperclip-meta without reprocessing the images themselves'
  task :reprocess => :environment do
    Paperclip::Meta::ProcessMetaService.process!(Rails.logger)
  end
end