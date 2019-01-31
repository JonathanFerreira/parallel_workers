class SyncProduct < ApplicationRecord

  def sync!
    SyncProductJob.perform_later(self.id)
  end
end
