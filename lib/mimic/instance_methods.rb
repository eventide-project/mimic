module Mimic
  module InstanceMethods
    def self.replace(cls)
      instance_methods = cls.instance_methods.sort
      preserved_methods = preserved

puts 'Instance Methods'
puts '- - -'
pp instance_methods
puts

puts 'Preserved Methods'
puts '- - -'
pp preserved_methods
puts

      void_methods = instance_methods - preserved_methods

puts 'Void Methods'
puts '- - -'
pp void_methods
puts


      void_methods.each do |m|
        cls.undef_method(m)
      end


remaining_methods = cls.instance_methods.sort

puts 'Remaining Instance Methods (after remove, should not have :some_method)'
puts '- - -'
pp remaining_methods
puts


puts ':some_method is included in instance methods list'
puts '- - -'
pp remaining_methods.include?(:some_method)
puts

puts 'instance responds to :some_method'
puts '- - -'
pp cls.new.respond_to?(:some_method)
puts

o = cls.new
begin
  o.some_method
rescue NoMethodError
  pp "Can't call :some_method on #{o}"
end

    end


    def self.preserved
      @preserved ||= %w(
        !
        !=
        ==
        __id__
        __send__
        equal?
        inspect
        instance_eval
        instance_exec
        method_missing
        object_id
        respond_to?
        singleton_method_added
        singleton_method_removed
        singleton_method_undefined
        to_s
      ).map(&:to_sym)
    end
  end
end
