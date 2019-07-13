# mimic

Copy a class's interface and apply it to a new object that acts as a mimic

## Example

``` ruby
class SomeClass
  def some_method
  end
end

mimic = Mimic.(SomeClass)

mimic.some_method
# => (no error)

mimic.some_other_method
# NameError (undefined local variable or method `some_other_method')

mimic.is_a?(SomeClass)
# => true

```
## License

The `mimic` library is released under the [MIT License](https://github.com/eventide-project/mimic/blob/master/MIT-License.txt).
