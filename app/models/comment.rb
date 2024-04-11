class Comment < ApplicationRecord
  belongs_to :user  # usersテーブルとのアソシエーション
  belongs_to :prototype  # prototypesテーブルとのアソシエーション

  validates :content, presence: true
  validates :prototype, presence: true
  validates :user, presence: true
end