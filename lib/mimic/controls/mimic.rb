module Mimic
  module Controls
    module Mimic
      def self.example
        ::Mimic.(subject_class)
      end

      def self.subject_class
        Subject::PositionalParameters::Example
      end

      module Predicate
        def self.example(strict: nil)
          ::Mimic.(Mimic.subject_class, record: true) do
            include ::Mimic::Recorder::Predicate

            predicate :some_predicate?, method_name: :some_method, strict: strict
          end
        end
      end
    end
  end
end
