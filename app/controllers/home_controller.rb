class HomeController < ApplicationController
  def show
    redirect_to invoices_path if logged_in?
  end
end