class AsyncCallServiceObjectWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default, retry: 3, backtrace: true

  def perform(service_object, *arguments)
    call_service(service_object, arguments)
  end

  private

  def call_service(service_object, arguments)
    service_object.call(*arguments)
  end
end
