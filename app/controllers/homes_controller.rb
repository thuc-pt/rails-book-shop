class HomesController < ApplicationController
  def index
    @cart = currentCart
    @slide_active = Slide.all.order('ID DESC').first
    @slides = Slide.find_by_sql("select * from slides order by id DESC limit 1,8")

    @book_highlight = Bookstore.all.where('highlight=1')
    @book_vietnamese = Bookstore.joins(:book).where('language_id=1').order('ID DESC').limit(18)
    @book_foreign = Bookstore.joins(:book).where('language_id=2')
    @book_psychological = Bookstore.joins(:book => [:category]).where("name='Tâm Lý Và Kĩ Năng Sống'")
    @book_economic = Bookstore.joins(:book => [:category]).where("name='Kinh Doanh'")
    @book_son = Bookstore.joins(:book => [:category]).where("name='Nuôi Dạy Con'")
  end
end