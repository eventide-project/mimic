module Mimic
  module Controls
    module Recorder
      def self.example
        Example.new
      end

      class Example
        include Mimic::Recorder
      end
    end
  end
end
