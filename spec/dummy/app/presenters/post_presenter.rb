# frozen_string_literal: true
class PostPresenter < ApplicationPresenter
  def title
    h.sanitize name.titleize
  end

  def body
    h.simple_format model.body
  end
end
