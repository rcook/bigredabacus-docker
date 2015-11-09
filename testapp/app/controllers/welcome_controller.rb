class WelcomeController < ApplicationController
  def index
  end

  def quit
    system("kill -9 #{Process.pid}")
  end
end

