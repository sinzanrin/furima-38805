class OrderForm 
    include ActiveModel::Model
    attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building_name, :phone_numder, :token

    with_options presence: true do
        # orderモデルのバリデーション
        validates :user_id
        validates :item_id
        # addressモデルのバリデーション
        validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
        validates :prefecture_id, numericality: { other_than: 0 }
        validates :city
        validates :address
        validates :phone_numder, format: { with: /\A[0-9]{10,11}\z/}
        validates :token
    end

    def save
        order = Order.create(user_id: user_id, item_id: item_id)
        Address.create(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_numder: phone_numder)
    end
end
