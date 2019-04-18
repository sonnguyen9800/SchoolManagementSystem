class ApplicationController < ActionController::Base
  def hello
    render html: "hello the world"

  end
end
