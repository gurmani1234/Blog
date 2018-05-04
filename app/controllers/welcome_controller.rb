class WelcomeController < ApplicationController
  def index
    respond_with do |format|
      format.html { render 'foo' }
    end
    # or shorter: respond_to :html
  end
