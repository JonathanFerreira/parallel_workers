class ProductJob < ApplicationJob
  queue_as :default

  def perform(sync_id)
    file_url = "#{Rails.root}/public/products.json"
    file = File.read file_url
    products = JSON.parse(file)

    products.each do |hash|
      sleep 5
      params = hash.merge(sync_product_id: sync_id)
      Product.create params
    end
  end
end
