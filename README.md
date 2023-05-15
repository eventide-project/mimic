# mimic

Copy a class's instance interface to an anonymous, new object that acts as a substitutable mimic for the class

## Example

``` ruby
class SomeClass
  def some_method
    puts 'In some_method'
  end
end

mimic = Mimic.(SomeClass)

mimic.some_method
# (does nothing)

mimic.some_other_method
# => undefined method `some_other_method' for #<Mimic::Class::SomeClass_0...:0x...> (NoMethodError)

mimic.is_a?(SomeClass)
# => true

mimic.class
# => Mimic::Class::SomeClass_0...
```

## Method Signatures

A mimicked method will have the same signature as the source method.

``` ruby
class SomeClass
  def some_method(some_parameter, some_other_parameter)
  end
end

mimic = Mimic.(SomeClass)

mimic.some_method
# => `some_method': wrong number of arguments (given 0, expected 2) (ArgumentError)
```

## Recording Invocations of a Mimic Object

A mimic can be optionally configured to to record invocations made against it.

Recording is activated using the `record` named parameter.

``` ruby
class SomeClass
  def some_method(some_parameter, some_other_parameter)
  end
end

mimic = Mimic.(SomeClass, record: true)
```

When the mimic's methods are invoked, the invocation and its arguments will be recorded.

``` ruby
mimic.some_method('some argument', 'some other argument')

mimic.invocation(:some_method)
# => #<Invocation:0x...
 @method_name=:some_method,
 @parameters={:some_parameter=>"some argument", :some_other_parameter=>"some other argument"}>

mimic.invocation(:some_random_method)
# => nil
```

The invocation can be retrieved based on parameter values.

``` ruby
mimic.some_method('some argument', 'some other argument')

mimic.invocation(:some_method, some_parameter: 'some argument')
# => #<Invocation:0x...
 @method_name=:some_method,
 @parameters={:some_parameter=>"some argument", :some_other_parameter=>"some other argument"}>

mimic.invocation(:some_method, some_other_parameter: 'some other argument')
# => #<Invocation:0x...
 @method_name=:some_method,
 @parameters={:some_parameter=>"some argument", :some_other_parameter=>"some other argument"}>

mimic.invocation(:some_method, some_parameter: 'some argument', some_other_parameter: 'some other argument')
# => #<Invocation:0x...
 @method_name=:some_method,
 @parameters={:some_parameter=>"some argument", :some_other_parameter=>"some other argument"}>
```

If more than one invocation is found, only the first invocation will be returned.

If a method should have only been invoked once, the `one_invocation` method will raise an error rather than return the first invocation.

``` ruby
mimic.some_method('some argument', 'some other argument')
mimic.some_method('some argument', 'yet another argument')

mimic.one_invocation(:some_method)
# => More than one invocation record matches (Method Name: :some_method, Parameters: nil) (Mimic::Recorder::Error)

mimic.one_invocation(:some_method, some_parameter: 'some argument')
# => More than one invocation record matches (Method Name: :some_method, Parameters: {:some_parameter => "some argument"}) (Mimic::Recorder::Error)
```

If only one invocation of the method was recorded, then that invocation will be returned, just as it does with the `invocation` method.

``` ruby
mimic.some_method('some argument', 'some other argument')

mimic.invocation(:some_method, some_parameter: 'some argument')
# => #<Invocation:0x...
 @method_name=:some_method,
 @parameters={:some_parameter=>"some argument", :some_other_parameter=>"some other argument"}>
```

If a method is invoked more than once, multiple invocation records can be retrieved.

``` ruby
mimic.some_method('some argument', 'some other argument')
mimic.some_method('another argument', 'yet another argument')

mimic.invocations(:some_method)
# => [#<Invocation:0x...
  @method_name=:some_method,
  @parameters={:some_parameter=>"some argument", :some_other_parameter=>"some other argument"}>,
 #<Invocation:0x...
  @method_name=:some_method,
  @parameters={:some_parameter=>"another argument", :some_other_parameter=>"yet another argument"}>]

mimic.invocations(:some_random_method)
# => []

mimic.invocations(:some_method, some_parameter: 'some argument')
# => [#<Invocation:0x...
  @method_name=:some_method,
  @parameters={:some_parameter=>"some argument", :some_other_parameter=>"some other argument"}>]

mimic.invocations(:some_method, some_other_parameter: 'some other argument')
# => [#<Invocation:0x...
  @method_name=:some_method,
  @parameters={:some_parameter=>"some argument", :some_other_parameter=>"some other argument"}>]

mimic.invocations(:some_method, some_parameter: 'some argument', some_other_parameter: 'some other argument')
# => [#<Invocation:0x...
  @method_name=:some_method,
  @parameters={:some_parameter=>"some argument", :some_other_parameter=>"some other argument"}>]
```

The mimic provides predicates for detecting whether an invocation has been made.

``` ruby
mimic.some_method('some argument', 'some other argument')

mimic.invoked?(:some_method)
# => true

mimic.invoked?(:some_random_method)
# => false

mimic.invoked?(:some_method, some_parameter: 'some argument')
# => true

mimic.invoked?(:some_method, some_other_parameter: 'some other argument')
# => true

mimic.invoked?(:some_method, some_parameter: 'some argument', some_other_parameter: 'some other argument')
# => true
```

If a method should have only been invoked once, the `invoked_once?` predicate will raise an error if more than one matching invocation is detected.

``` ruby
mimic.some_method('some argument', 'some other argument')
mimic.some_method('some argument', 'yet another argument')

mimic.invoked_once?(:some_method)
# => More than one invocation record matches (Method Name: :some_method, Parameters: nil) (Mimic::Recorder::Error)

mimic.invoked_once?(:some_method, some_parameter: 'some argument')
# => More than one invocation record matches (Method Name: :some_method, Parameters: {:some_parameter => "some argument"}) (Mimic::Recorder::Error)
```

If only one invocation of the method was recorded, then the predicate will respond affirmatively.

``` ruby
mimic.some_method('some argument', 'some other argument')

mimic.invoked_once?(:some_method, some_parameter: 'some argument')
# => true
```

The methods of the recorder may conflict with the methods implemented on the mimicked class. If so, a secondary set of method names may be used to access the mimic's diagnostic functions:

- __invocation
- __invocations
- __invoked?
- __invoked_once?

## Mimicked Methods and the Void Return Type

Methods on a mimicked object are replaced with an implementation that returns an instance of `Mimic::Void`.

The purpose of this is to ensure that code that attempts to invoke any subsequent method on a value returned from a replaced method will result in an error.

``` ruby
mimic = Mimic.(SomeClass)

result = mimic.some_method
puts result.class
# => Mimic::Void

mimic.some_method.any_method
# => Mimic::Void::Error (Cannot invoke `any_method' on a void)
```

NOTE: Method chaining is not possible with a mimicked object. This is done with respect to the [Law of Demeter](https://en.wikipedia.org/wiki/Law_of_Demeter).

## Specializing Mimic Objects

A mimicked object can be specialized by passing a block argument to the `Mimic` actuator.

``` ruby
mimic = Mimic.(SomeClass) do
  def an_instance_method
    puts 'In an_instance_method'
  end

  def self.a_class_method
    puts 'In a_class_method'
  end
end

mimic.an_instance_method
# => "In an_instance_method"

mimic.class.a_class_method
# => "In a_class_method"
```

## Preserved Methods

Mimicked objects' instance methods are replaced with voided methods _except_ for instance methods defined on Ruby's `Object` class and the `method_missing` method.

A list of methods that are preserved can be retrieved from the `Mimic::ReplaceMethods` module.

``` ruby
puts Mimic.preserved_methods
```

## Method Missing and the Null Object Mimic

If the class being mimicked implements the `method_missing` method, it will not be replaced with a voided method. This makes it possible to construct a general purpose _null object_ implementation.

``` ruby
class SomeClass
  def method_missing(*)
  end
end

mimic = Mimic.(SomeClass)

mimic.any_method
# (does nothing)
```

## Uses

The Mimic library is the substitute generator in the [Dependency](https://github.com/eventide-project/dependency) library. It's used for creating both null objects and mimics of declared dependencies.

``` ruby
class SomeDependencyClass
  def call
  end
end

class SomeClass
  dependency :some_dependency, SomeDependencyClass
end

obj = SomeClass.new

obj.some_dependency.()

obj.some_method_that_doesnt_exist
# => undefined method `some_method_that_doesnt_exist' for #<Mimic::Class::SomeDependencyClass_0..:0x..> (NoMethodError)

obj.dependency.class
# => Mimic::Class::SomeDependencyClass_0..
```

## License

The `mimic` library is released under the [MIT License](https://github.com/eventide-project/mimic/blob/master/MIT-License.txt).
