class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :exercises
  has_many :followings
  has_many :friends, through: :followings, class_name:"User"

  validates :first_name, presence: true
  validates :last_name, presence: true
  
  self.per_page = 10

  def full_name
    [first_name, last_name].join(" ")
  end

  def self.search_by_name(name)
    names_array = name.split(" ")

    if names_array.size == 1
      where('first_name LIKE ? or last_name LIKE ?',"%#{names_array[0]}","%#{names_array[0]}").order(:first_name)
    else
      where('first_name LIKE ? or first_name LIKE ? or last_name LIKE ? or last_name LIKE ?',"%#{names_array[0]}","%#{names_array[1]}","%#{names_array[0]}","%#{names_array[1]}").order(:first_name)
    end
  end
  #class method

  def follows?(new_friend)
    followings.map(&:friend).include?(new_friend) 
  end

  def same?(new_friend)
    self == new_friend
  end

  def current_following(friend)
    followings.where(friend: friend).first.id
  end
end
