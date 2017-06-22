require 'httparty'
require 'json'

class Kele
  include HTTParty

  def initialize(email, password)
    base_url = 'https://www.bloc.io/api/v1'
    @auth_token = self.class.post('https://www.bloc.io/api/v1/sessions', body: {"email": email, "password": password})

    if @auth_token == '' || nil
      puts 'Invalid Credentials'
    else
      puts 'Welcome'
    end

  end

  def get_me

  response = self.class.get('https://www.bloc.io/api/v1/users/me', headers: { "authorization" => @auth_token })
  @user_data = JSON.parse(response.body)
  @user_data

  end


end
