class LifeSkillController < ApplicationController
  def index
    @cart = currentCart
    @lifeSkill = Bookstore.joins(:book => [:category]).where("name='Tâm Lý Và Kĩ Năng Sống'").paginate(:page => params[:page], :per_page => 30)
  end
end
