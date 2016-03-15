class FarMar::Product
  attr_reader :id, :name, :vendor_id

  extend FarMar::FarMarMethods

  def initialize(info_hash)
    @id = info_hash[:id].to_i
    @name = info_hash[:name]
    @vendor_id = info_hash[:vendor_id].to_i
  end

  def self.all(file = './support/products.csv')
    product_keys = [:id, :name, :vendor_id]

    make_all(file, product_keys)
  end

  def self.by_vendor(id_of_vendor)
    self.all.find_all do |product|
      product.vendor_id == id_of_vendor
    end
  end

end