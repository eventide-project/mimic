module Mimic
  module Controls
    module Recorder
      def self.example
        Example.new
      end

      class Example
        include RecordInvocation
      end
    end
  end
end
