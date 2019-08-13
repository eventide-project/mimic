require_relative 'automated_init'

context "Subject Methods" do
  subject_class = Controls::Subject.example

  implemented_methods = Controls::Subject.implemented_methods

  subject_methods = Mimic.subject_methods(subject_class)

  test "Subject class's implemented methods" do
    assert(subject_methods.sort == implemented_methods.sort)
  end
end
