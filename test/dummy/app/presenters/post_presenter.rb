# frozen_string_literal: true
class PostPresenter < ApplicationPresenter
  def title
    name.titleize
  end

  def body
    h.simple_format model.body
  end
end
