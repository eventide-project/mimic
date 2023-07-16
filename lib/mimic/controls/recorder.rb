module Mimic
  module Controls
    module Recorder
      def self.example
        Example.new
      end

      class Example
##
        # include Mimic::Recorder
        include RecordInvocation
      end
    end
  end
end
