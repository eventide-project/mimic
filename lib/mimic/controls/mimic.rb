module Mimic
  module Controls
    module Mimic
      def self.example
        ::Mimic.(Subject::Class.example)
      end

      module Class
        def self.example
          ::Mimic::Build.(Subject::Class.example)
        end
      end
    end
  end
end
