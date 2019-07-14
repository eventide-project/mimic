require_relative 'automated_init'

context "Class Name" do
  context "Static" do
    subject_class = Controls::Subject::Class.example

    cls = Mimic::Class.build(subject_class)

    class_name = cls.name

    if ENV['VERBOSE'] == 'on'
      pp class_name
    end

    test "Based on the subject class name" do
      assert(class_name.include?("Mimic_Controls_Subject_Example_"))
    end

    test "Member of the Mimic::Class namespace" do
      assert(class_name.start_with?("Mimic::Class"))
    end
  end

  context "Anonymous" do
    subject_class = Controls::Subject::Class::Anonymous.example

    cls = Mimic::Class.build(subject_class)

    class_name = cls.name

    if ENV['VERBOSE'] == 'on'
      pp class_name
    end

    test "Nested in the Mimic::Class namespace" do
      assert(class_name.start_with?("Mimic::Class"))
    end

    test "Synthetic class name is composed of the class's object ID" do
      assert(class_name.end_with?("C#{cls.object_id.to_s}"))
    end
  end
end
