RSpec::Matchers.define :have_accessible_attributes do |*attributes|
  incorrect = []
  match do |response|
    attributes.each do |attribute|
      unless response.class.accessible_attributes.include?(attribute)
        incorrect << attribute
      end
    end
    incorrect.empty?
  end
  description { "be accessible :#{attributes.join(', :')}" }
  failure_message_for_should { ":#{incorrect.join(', :')} should be accessible" }
  failure_message_for_should_not { ":#{incorrect.join(', :')} should not be accessible" }
end