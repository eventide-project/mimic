module Mimic
  module Controls
    module Mimic
      def self.example
        Class.example.new
      end

      module Class
        def self.example
          ::Mimic.(Subject::Class.example)
        end
      end
    end
  end
end
