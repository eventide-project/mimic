require_relative 'automated_init'

context "Class Name" do
  subject_class = Controls::Subject::Class.example

  cls = Mimic::Class.get(subject_class)

  class_name = cls.name

  test "Based on the subject class name" do
    assert(class_name.include?("Mimic_Controls_Subject_Example_"))
  end

  test "Nested in the Mimic::Class namespace" do
    assert(class_name.start_with?("Mimic::Class"))
  end
end
