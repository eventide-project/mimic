module Mimic
  module RemoveMethods
    def self.call(cls)
      instance_methods = cls.instance_methods.sort
      preserved_methods = preserved

      void_methods = instance_methods - preserved_methods

      void_methods.each do |m|
        cls.undef_method(m)
      end

      nil
    end

    def self.preserved
      # @preserved ||= %w(
      #   !
      #   !=
      #   ==
      #   ===
      #   __id__
      #   __send__
      #   equal?
      #   inspect
      #   instance_eval
      #   instance_exec
      #   object_id
      #   respond_to?
      #   to_s
      # ).map(&:to_sym)

      @preserved ||= Object.instance_methods.sort

    end
  end
end
