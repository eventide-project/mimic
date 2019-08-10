require_relative '../automated_init'

context "Invocation" do
  context "Single" do
    subject_class = Controls::Subject::Anonymous.example

    mimic = Mimic.(subject_class, record: true)

    mimic.a_method
  end
end
