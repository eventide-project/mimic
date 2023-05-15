module Mimic
  module Recorder
    module Predicate
      def self.included(cls)
        cls.class_exec do
          extend Macro
        end
      end

      module Macro
        def predicate(predicate_name, method_name:, strict: nil)
          if strict.nil?
            strict = true
          end

          send(:define_method, predicate_name) do |**parameters|
            parameters[:strict] = strict
            invoked?(method_name, **parameters)
          end
        end
      end
    end
  end
end
