class Book < ApplicationRecord

  belongs_to :user #ユーザーに属する,1:N の「N」側にあたるモデル

end
