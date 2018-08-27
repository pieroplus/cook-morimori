class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :request_path
  before_action :get_datetime
  before_action :get_best_foodstuff

  def request_path
    @path = controller_path + '#' + action_name
    def @path.is(*str)
        str.map{|s| self.include?(s)}.include?(true)
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :icon_image, :introduction ])
    devise_parameter_sanitizer.permit(:account_update, keys:[:name, :icon_image, :introduction ])
  end

  def get_datetime
    @date = Date.today
    system_month = @date.month
    @month = Season.find(system_month)
  end

  def get_best_foodstuff
    @foodstuff_ids = []
    foodstuffs = @month.foodstuffs.all
    foodstuffs.each do |foodstuff|
      @foodstuff_ids << foodstuff.id
    end
    morimori_foodstuffs = MorimoriFoodstuff.where(foodstuff_id: [@foodstuff_ids])
    @morimori_ids = morimori_foodstuffs.ids
  end

end
