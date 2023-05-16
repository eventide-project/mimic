require_relative '../../../automated_init'

context "Recorder" do
  context "Queries" do
    context "One Invocation" do
      context "By Method Name and Parameters" do
        invocation = Controls::Invocation.example

        context "Recorded One" do
          context "Matched Parameters" do
            context "One Parameter Match" do
              recorder = Controls::Recorder.example

              recorder.record(invocation)

              method_name = invocation.method_name
              parameters = { some_parameter: 1 }

              retrieved_invocation = recorder.one_invocation(method_name, **parameters)

              context "Retrieved" do
                assert(retrieved_invocation == invocation)
              end
            end

            context "Multiple Parameters Match" do
              recorder = Controls::Recorder.example

              recorder.record(invocation)

              method_name = invocation.method_name
              parameters = { some_parameter: 1, some_other_parameter: 11 }

              retrieved_invocation = recorder.one_invocation(method_name, **parameters)

              test "Retrieved" do
                assert(retrieved_invocation == invocation)
              end
            end
          end

          context "Mismatched Parameters" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)

            method_name = invocation.method_name
            parameters = { some_parameter: SecureRandom.hex }

            retrieved_invocation = recorder.one_invocation(method_name, **parameters)

            test "Not Retrieved" do
              assert(retrieved_invocation.nil?)
            end
          end
        end

        context "Recorded Multiple" do
          context "Matched Parameters" do
            context "One Parameter Match" do
              recorder = Controls::Recorder.example

              recorder.record(invocation)
              recorder.record(invocation)

              method_name = invocation.method_name
              parameters = { some_parameter: 1 }

              test "Is an error" do
                assert_raises(Recorder::Error) do
                  recorder.one_invocation(invocation.method_name, **parameters)
                end
              end
            end

            context "Multiple Parameters Match" do
              recorder = Controls::Recorder.example

              recorder.record(invocation)
              recorder.record(invocation)

              method_name = invocation.method_name
              parameters = { some_parameter: 1, some_other_parameter: 11 }

              test "Is an error" do
                assert_raises(Recorder::Error) do
                  recorder.one_invocation(invocation.method_name, **parameters)
                end
              end
            end
          end
        end

        context "Not Recorded" do
          recorder = Controls::Recorder.example

          method_name = invocation.method_name
          parameters = { some_parameter: 1 }

          retrieved_invocation = recorder.one_invocation(method_name, **parameters)

          context "Not Retrieved" do
            assert(retrieved_invocation.nil?)
          end
        end
      end
    end
  end
end
