require_relative 'automated_init'

context "Class" do
  subject = Controls::Subject::Class.example
  mimic = Mimic.(subject).new

  test "Is a subclass of the subject" do
    assert(mimic.is_a?(subject))
  end
end
