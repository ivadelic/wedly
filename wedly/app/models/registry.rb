class Registry < ActiveRecord::Base
  belongs_to :wedding
  before_validation :smart_add_url_protocol

protected

  def smart_add_url_protocol
    unless self.link_to_registry[/^https?:\/\//]
      self.link_to_registry = "http://#{self.link_to_registry}"
    end
  end
end