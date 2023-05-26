module Mimic
  module Controls
    module Mimic
      def self.example
        ::Mimic.(subject_class)
      end

      def self.subject_class
        Subject::PositionalParameters::Example
      end
    end
  end
end
