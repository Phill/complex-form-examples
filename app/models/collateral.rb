class Collateral < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true

  has_attached_file :asset,
    url:  "/system/assets/:id/:fingerprint/:style/:sanitized_file_name.:extension",
    path: ":rails_root/public/system/:attachment/:id/:fingerprint/:style/:sanitized_file_name.:extension",
    include_updated_timestamp: false,
    default_url: '/missing.png',
    styles: lambda { |attachment|
      {
        medium: { geometry: "300x300>", format: 'png' },
        thumb:  { geometry: "100x100>", format: 'png' },
        small:  { geometry:   "50x50>", format: 'png' }
      }
    }

  Paperclip.interpolates :sanitized_file_name do |attachment, style|
    attachment.instance.sanitized_file_name
  end

  def sanitized_file_name(filename = nil)
    filename = filename || self.asset_file_name
    filename = filename.downcase
    extension = File.extname(filename)
    filename = filename.gsub(extension, '')
    filename = filename.gsub(/[\$,\(\)]/, '').gsub(/([^a-zA-Z0-9]+)/, '-').gsub(/^-|-$/, '')
    filename = File.basename(filename)
  end

end

