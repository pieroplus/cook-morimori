class MorimorisController < ApplicationController
  before_action :get_category

 # before_action :get_morimoris

  def index

    morimoris = []
    @subfood_foodstuffs = []
    @mainfood_foodstuffs = []

    #おすすめ料理の検索
    @recommend_subfoods = Morimori.includes(:user).where(id: @morimori_ids).main_sub(0).get_random(2)
    @recommend_mainfoods = Morimori.includes(:user).where(id: @morimori_ids).main_sub(1).get_random(2)
    find_foodstuffs(@recommend_subfoods)
    find_foodstuffs(@recommend_mainfoods)

    # カテゴリ毎の旬の食材検索
    @vegetables = @month.foodstuffs.where(category_id: @vegetable).limit(7)
    @fruits     = @month.foodstuffs.where(category_id: @fruit).limit(7)
    @fishes     = @month.foodstuffs.where(category_id: @fish).limit(7)
    @seafoods   = @month.foodstuffs.where(category_id: @seafood).limit(7)
    @others     = @month.foodstuffs.where(category_id: @other).limit(7)
    @categorys  = Category.all.order('id ASC')

    #おすすめユーザ検索
    if user_signed_in?
      @recommend_users = User.where.not(id: current_user.id).order("morimoris_count DESC").limit(4)
    else
      @recommend_users = User.order("morimoris_count DESC").limit(4)
    end
  end

  # おすすめ料理で使用している旬の食材を取得する。
  def find_foodstuffs(recommend_foods)
    recommend_foods.each do |recommend_food|
      foodstuff = recommend_food.foodstuffs.merge(Morimori.get_random(2))
      if recommend_food.mainsub_id == 0
        @subfood_foodstuffs << foodstuff
      elsif recommend_food.mainsub_id == 1
        @mainfood_foodstuffs << foodstuff
      end
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
end




