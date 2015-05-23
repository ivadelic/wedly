class RegistriesController < ApplicationController
  def index
    @registries = Registry.all
    @wedding = Wedding.new
  end

  def new
    @registry = Registry.new
    @wedding = Wedding.new
  end

end
