class Book < ApplicationRecord

  belongs_to :user #ユーザーに属する,1:N の「N」側にあたるモデル

  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}

end
