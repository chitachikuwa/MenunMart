class Category < AvtiveHash::Base
  self.date = [
    {id: 0, name:"----"}, {id: 1, name:"主食"}, {id: 2, name:"副菜"}, {id: 3, name:"一品料理"}, {id:4, name:"汁物"}
  ]
  include ActiveHash::Associations
  hes_many :recipes
end  