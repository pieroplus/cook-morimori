class MorimorisController < ApplicationController
  before_action :get_category

  def index
    @vegetables = @month.foodstuffs.where(category_id: @vegetable).order('id ASC').limit(7)
    @fruits     = @month.foodstuffs.where(category_id: @fruit).order('id ASC').limit(7)
    @fishes     = @month.foodstuffs.where(category_id: @fish).order('id ASC').limit(7)
    @seafoods   = @month.foodstuffs.where(category_id: @seafood).order('id ASC').limit(7)
    @others     = @month.foodstuffs.where(category_id: @other).order('id ASC').limit(7)
    @categorys  = Category.all.order('id ASC')
  end

  private
  def get_category
    @vegetable = Category.find(1)
    @fruit     = Category.find(2)
    @fish      = Category.find(3)
    @seafood   = Category.find(4)
    @other     = Category.find(5)
  end
end
