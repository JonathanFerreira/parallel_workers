class SyncProductJob < ApplicationJob
  queue_as :default

  def perform(sync_id)
    batch = Sidekiq::Batch.new
    batch.on(:success, SyncProductJob, sync_id)
    batch.jobs do
      ProductJob.perform_later(sync_id)
    end
  end

  def on_success(status, sync_id)
    Sidekiq.logger.info "Success #{sync_id} #{status.data}"
    sync_product = SyncProduct.find(sync_id)
    sync_product.update_attributes({state: 'completed'})
  end
end
