# frozen_string_literal: true

class CallServiceObjectJob < ApplicationJob
  def perform(service_object, *arguments)
    service_object.constantize.call(*arguments)
  end
end
