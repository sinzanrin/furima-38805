class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions


    # テーブルとのアソシエーション
    belongs_to :user

    with_options presence: true do
        validates :image
        validates :name
        # 300円以上かつ9,999,999円以下で、半角数字でないと入力できない
        validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
        validates :description
        validates :status_id
        validates :shipping_cost_id
        validates :shipping_day_id
        validates :prefecture_id
        validates :category_id
    end 
    
    # ジャンルの選択が「--」の時は保存できない
    with_options numericality: { other_than: 0 } do
        validates :category_id
        validates :prefecture_id
        validates :status_id
        validates :shipping_cost_id
        validates :shipping_day_id
    end   

    # アクティブハッシュとのアソシエーション
    belongs_to :category
    belongs_to :prefecture
    belongs_to :status
    belongs_to :shipping_cost
    belongs_to :shipping_day



    # active_storageとのアソシエーション
    # （items・active_storage_blobsテーブルを関連付け）
    has_one_attached :image

 
end
