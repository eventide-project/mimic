require_relative 'automated_init'

context "Subject Methods" do
  subject_class = Controls::Subject.example

  implemented_methods = Controls::Subject.implemented_methods.sort

  subject_methods = Mimic.subject_methods(subject_class).map(&:name).sort

  test "Subject class's implemented methods" do
    assert(subject_methods == implemented_methods)
  end
end
