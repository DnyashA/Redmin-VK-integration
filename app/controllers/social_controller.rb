class SocialController < ApplicationController
  def parse
    @user = User.where("social_id": params[:uid])
    @command = params[:com].to_s
    case @command
    when "projects"
      get_projects(@user[:id]) #Возвращает проекты пользователя
    when "issues"
      get_issues(@user[:id]) #Возвращает задачи пользователя
  end

  def get_projects(uid)

  end

  def get_issues(uid)

  end

  def message_send
    @user = User.current
    HTTParty.post("http://dnyasha.pythonanywhere.com/",
      :body => {
        :type => 'message_new',
        :object => {
          :id => '10',
          :date => '1525354943',
          :out => '0',
          :user_id => @user[:social_id],
          :read_state => '0',
          :title => '',
          :body => 'something'
        },
        :group_id => '165844956',
        :secret => 'e87aef82e87aef82'
      }.to_json,
      :headers => { 'Content-Type' => 'application/json' })
  end
end
