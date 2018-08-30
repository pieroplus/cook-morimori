class MorimorisController < ApplicationController
  before_action :find_category

  def index
    @sub_foodstuffs = []
    @main_foodstuffs= []
    @sub_best_foodstuffs = []
    @main_best_foodstuffs = []

    #おすすめ料理の検索
    find_recommend_foods(2)
    # カテゴリ毎の旬の食材検索
    @vegetables = @month.foodstuffs.merge(Morimori.get_category(@vegetable))
    @fruits     = @month.foodstuffs.merge(Morimori.get_category(@fruit))
    @fishes     = @month.foodstuffs.merge(Morimori.get_category(@fish))
    @seafoods   = @month.foodstuffs.merge(Morimori.get_category(@seafood))
    @others     = @month.foodstuffs.merge(Morimori.get_category(@other))
    @categorys  = Category.where.not(id: 6).order('id ASC')
    #おすすめユーザ検索
    find_recommend_users(4)
  end

  def show
    @recommend_best_foodstuffs = []
    @food = Morimori.includes(:user).find(params[:id])
    @foodstuffs = @food.foodstuffs
    @show_best_foodstuffs = @foodstuffs.where(id: @foodstuff_ids)
    @food_makes = @food.makes.order("ID ASC")

    #おすすめ料理の検索
    find_recommend_foods(3)
    #新着料理の検索
    find_new_foods(3)
    #おすすめユーザ検索
    find_recommend_users(3)
  end

  #おすすめ料理検索
  def find_recommend_foods(count)
    if @path.is('morimoris#index')
      @recommend_subfoods = Morimori.includes(:user).where(id: @morimori_ids).main_sub(0).get_random(count)
      @recommend_mainfoods = Morimori.includes(:user).where(id: @morimori_ids).main_sub(1).get_random(count)
      find_foodstuffs(@recommend_subfoods)
      find_foodstuffs(@recommend_mainfoods)
    elsif @path.is('morimoris#show')
      @recommend_foods = Morimori.includes(:user).where(id: @morimori_ids).where.not(id: @food.id).get_random(count)
      find_foodstuffs(@recommend_foods)
    else
      @recommend_foods = Morimori.includes(:user).where(id: @morimori_ids).get_random(count)
      find_foodstuffs(@recommend_foods)
    end
  end

  def find_new_foods(count)
    @new_foods = Morimori.includes(:user).order("created_at DESC").get_random(count)
    find_foodstuffs(@new_foods)
  end

  # 料理で使用している食材を取得する。
  def find_foodstuffs(foods)
    foods.each do |food|
      foodstuff = food.foodstuffs
      best_foodstuff = food.foodstuffs.where(id: @foodstuff_ids)
      if @path.is('morimoris#index')
        case food.mainsub_id
          when 0
            @sub_foodstuffs << foodstuff
            @sub_best_foodstuffs << best_foodstuff
          when 1
            @main_foodstuffs << foodstuff
            @main_best_foodstuffs << best_foodstuff
        end
      else
        @recommend_best_foodstuffs << best_foodstuff
      end
    end
  end

  def find_recommend_users(count)
    if user_signed_in?
      @recommend_users = User.where.not(id: current_user.id).order("morimoris_count DESC").limit(count)
    else
      @recommend_users = User.order("morimoris_count DESC").limit(count)
    end
  end


  private

  def find_category
    @vegetable = Category.find(1)
    @fruit     = Category.find(2)
    @fish      = Category.find(3)
    @seafood   = Category.find(4)
    @other     = Category.find(5)
  end
end




