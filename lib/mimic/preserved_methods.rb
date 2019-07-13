module Mimic
  def self.preserved_methods
    @preserved ||= (Object.instance_methods << :method_missing).sort
  end
end
