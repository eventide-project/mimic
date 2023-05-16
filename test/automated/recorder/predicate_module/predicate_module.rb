require_relative '../../automated_init'

context "Recorder" do
  context "Predicate Module" do
    context "By Method Name and Parameters" do
      invocation = Controls::Invocation.example

      context "Recorded" do
        context "Matched Parameters" do
          context "One Recorded" do
            context "One Parameter Match" do
              mimic = Controls::Mimic::Predicate.example

              mimic.record(invocation)

              parameters = { some_parameter: 1 }

              detected = mimic.some_predicate?(**parameters)

              test "Detected" do
                assert(detected)
              end
            end

            context "Multiple Parameters Match" do
              mimic = Controls::Mimic::Predicate.example

              mimic.record(invocation)

              parameters = { some_parameter: 1, some_other_parameter: 11 }

              detected = mimic.some_predicate?(**parameters)

              test "Detected" do
                assert(detected)
              end
            end

            context "Mismatched Parameters" do
              mimic = Controls::Mimic::Predicate.example

              mimic.record(invocation)

              parameters = { some_parameter: SecureRandom.hex }

              detected = mimic.some_predicate?(**parameters)

              test "Not Detected" do
                refute(detected)
              end
            end
          end
        end
      end

      context "Not Recorded" do
        mimic = Controls::Mimic::Predicate.example

        parameters = { some_parameter: 1 }

        detected = mimic.some_predicate?(**parameters)

        test "Not Detected" do
          refute(detected)
        end
      end
    end
  end
end
