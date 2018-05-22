class MorimorisController < ApplicationController
  before_action :get_category
  before_action :get_best_foodstuffs

  def index
    # 旬の食材検索
    @vegetables = @month.foodstuffs.where(category_id: @vegetable).order('id ASC').limit(7)
    @fruits     = @month.foodstuffs.where(category_id: @fruit).order('id ASC').limit(7)
    @fishes     = @month.foodstuffs.where(category_id: @fish).order('id ASC').limit(7)
    @seafoods   = @month.foodstuffs.where(category_id: @seafood).order('id ASC').limit(7)
    @others     = @month.foodstuffs.where(category_id: @other).order('id ASC').limit(7)
    @categorys  = Category.all.order('id ASC')
    # 本日のおすすめ料理検索
    @recommend_mainfoods = @morimoris.includes(:user).where(mainsub_id: 1).order("RAND()").limit(2) #主菜
    @recommend_subfoods  = @morimoris.includes(:user).where(mainsub_id: 2).order("RAND()").limit(2) #副菜
    #おすすめユーザ検索
    if user_signed_in?
      @recommend_users     = User.where.not(id: current_user.id).order("morimoris_count DESC").limit(4)
    else
      @recommend_users     = User.order("morimoris_count DESC").limit(5)
    end
  end

  private
  def get_category
    @vegetable = Category.find(1)
    @fruit     = Category.find(2)
    @fish      = Category.find(3)
    @seafood   = Category.find(4)
    @other     = Category.find(5)
  end

  def get_best_foodstuffs
    ids = []
    @foodstuff = @month.foodstuffs.order("RAND()").first
    cooks = Cook.where(foodstuff_id: [@month.foodstuffs.ids])
    cooks.find_each do |cook|
      ids << cook.morimori_id
    end
    @morimoris = Morimori.where(id: [ids])
  end
end
