class Post < ApplicationRecord

  default_scope -> { order(created_at: :desc) }

  validates :user_id, {presence: true}
  validates :category, {presence: true}
  validates :title, {presence: true, length: {maximum: 50}}
  validates :content, {presence: true, length: {maximum: 300}}

  belongs_to :user                   #belongs_to関連付けで指定するモデル名は必ず単数形
                                    #これで user と結び付けて、ユーザーが削除されれば帰属する全ての投稿データも削除される

  has_many :entries, dependent: :destroy


end
