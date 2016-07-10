require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  fixtures :posts

  let :post do
    posts :latest
  end

  scenario 'decorate and delegate methods' do
    visit posts_path(post)

    expect(page).to have_content(post.present.title)
    expect(page).to have_content(post.present.body)
  end

  scenario 'decorated from the model level' do
    visit posts_path

    expect(page).to have_content(post.present.title)
  end
end
