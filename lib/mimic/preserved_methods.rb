module Mimic
  def self.preserved_methods
    @preserved ||= Object.instance_methods.sort
  end
end
