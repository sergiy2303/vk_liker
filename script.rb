require 'capybara'

class Processer < Capybara::Session

  def login
    sleep 1
    visit('https://vk.com/')
    fill_in 'index_email', with: ENV['login']
    fill_in 'index_pass', with: ENV['password']
    first('#index_login_button').click
    sleep 2
  end

  def visit_link(id)
    visit "https://vk.com/#{id}"
    sleep 3
    first('.page_avatar_wrap #profile_photo_link').click
    sleep 3
  end

  def run
    first('.pv_photo_wrap .ui_scroll_content .pv_like_icon._icon').click
  end
end

p '============Start============='
p Time.now
session = Processer.new(:selenium)
session.login
session.visit_link(ENV['id'])

100000.times do |time|
  p time
  session.run
  sleep(2)
end
