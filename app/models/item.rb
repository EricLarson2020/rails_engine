class Item < ApplicationRecord
  belongs_to :merchant

   has_many :invoice_items
   has_many :invoices, through: :invoice_items


   has_many :order_items
   has_many :orders, through: :order_items
   # def as_json(options={})
   #   super(only: [:name])
   #
   #
   # end

end

# user.as_json(:include => { :posts => {
#                              :include => { :comments => {
#                                              :only => :body } },
#                              :only => :title } })
# render json: Item.all
# render :json => { :data => {
#   :name => @items.name}
# }


# :user => { :email => @user.email } }
# item = Item.all
# item.as_json



# user.as_json(include: { posts: {
#                          include: { comments: {
#                                         only: :body } },
#                          only: :title } })
# => { "id" => 1, "name" => "Konata Izumi", "age" => 16,
#      "created_at" => "2006-08-01T17:27:13.000Z", "awesome" => true,
#      "posts" => [ { "comments" => [ { "body" => "1st post!" }, { "body" => "Second!" } ],
#                     "title" => "Welcome to the weblog" },
#                   { "comments" => [ { "body" => "Don't think too hard" } ],
#                     "title" => "So I was thinking" } ] }
