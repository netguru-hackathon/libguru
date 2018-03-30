class CallServiceObjectJob < ApplicationJob
  def perform(service_object, *arguments)
    service_object.call(*arguments)
  end
end
