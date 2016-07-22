# Makeover

[![Build Status](https://travis-ci.org/tubbo/makeover.svg?branch=master)](https://travis-ci.org/tubbo/makeover)
[![Code Climate](https://codeclimate.com/github/tubbo/makeover/badges/gpa.svg)](https://codeclimate.com/github/tubbo/makeover)
[![Issue Count](https://codeclimate.com/github/tubbo/makeover/badges/issue_count.svg)](https://codeclimate.com/github/tubbo/makeover)
[![Test Coverage](https://codeclimate.com/github/tubbo/makeover/badges/coverage.svg)](https://codeclimate.com/github/tubbo/makeover/coverage)

A [decorator][] library for [Rails][] applications, inspired by
[Draper][], but with an emphasis on architectural simplicity. Makeover
uses the given [ActiveSupport][] and [Ruby standard library][stdlib]
objects that can help in building an object-presentation layer for your
models.

## Usage

After installing, run the following command to get things set up:

```bash
$ bin/rails makeover:install
```

This will mix in the `Makeover::Presentable` module into your
`ApplicationRecord` model code, enabling models to be presented by
calling `model.present`. This module is also mixed into your
`ApplicationController`, because the `present` method can be called with
an optional first argument that dictates the model being presented. In
addition to mixing itself in (visibly) to your controller and model
layer, this generator also creates an `ApplicationPresenter` and
`CollectionPresenter` base class for presenting models and collections,
respectively. All makeover will be derived from one of these base
classes.

In your application code, presentation would look like the following:

```ruby
class PostsController < ApplicationController
  def index
    @posts = present Post.search(params[:q])
  end

  def show
    @post = Post.find(params[:id]).present
  end
end
```

It is recommended to choose one syntax and make that standard across
your app, however both syntaxes are provided in case one or the other
works out better for you. Conventionally, presenter classes are found
by taking the model name and adding "Presenter" to the end, or in the
case of collections, pluralizing the model name and then suffixing with
"Presenter". You can customize this by passing the `with:` option into
the `#present` method:

```ruby
@post.present with: SearchResultPresenter
```

You can also use this options hash to apply context into the presenter.
A call to `#present` like this:

```ruby
@post.present with: SearchResultPresenter, search: @search
```

Will result in the following instantiation:

```ruby
SearchResultPresenter.new(@post, search: @search)
```

### The Presenter Class

Makeover are subclasses of `Makeover::Presenter`, which itself
subclasses (and implements [Delegator][]. The Delegator API was designed
specifically for implementing decorator objects such as this, and it's
utilized here to delegate all method calls not implemented on the
presenter itself to its underlying model. In addition, the Presenter
class contains an instance of a `Makeover::Helpers` object, which
mixes in `ActionView::Helpers` as well as any modules you define in
`Rails.application.config.makeover.helpers`.

This library is also capable of presenting entire collections of
objects. You can opt to present the collection object itself (like
in cases of pagination), or the objects within it. Collection makeover
derive from `Makeover::CollectionPresenter`, and in your application
the base collection presenter is called `CollectionPresenter`.
These types of objects can be generated using the `--collection` flag on
the presenter generator (as described below), but they're also generated
automatically when you pass a plural name into the presenter generator.
Collection makeover are [Enumerable][] objects, and when iterating
over their `model`, all records inside the collection are decorated
prior to returning to the caller.

### Generating Makeover

To generate a presenter, run the following command:

```bash
$ bin/rails generate presenter post
```

This will generate **app/makeover/post_presenter.rb** as a subclass fo
`ApplicationPresenter`. It will also generate a test file in
**test/makeover/post_presenter_test.rb** or
**spec/makeover/post_presenter_spec.rb**.

A typical presenter might look like this:

```ruby
class PostPresenter < ApplicationPresenter
  def title
    model.name.titleize
  end

  def cover_image
    h.image_tag model.cover_image_url
  end
end
```

You can also generate collection makeover using this generator. This
can be done in one of two ways, either by passing a plural name into the
generator:

```bash
$ bin/rails generate presenter posts
```

Or, by passing the `--collection` option in the generator arguments:

```bash
$ bin/rails generate presenter query --collection
```

This will generate a presenter class that is subclassed from
`CollectionPresenter`, rather than `ApplicationPresenter`.

### Configuring Makeover

To mix helper modules into your makeover, add the following to your
**config/application.rb**:

```ruby
config.makeover.helpers << Refile::AttachmentHelper # or whatever module you want
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'makeover'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install makeover
```

## Contributing

All contributions to this library must follow the [Code of Conduct][].
Please follow the instructions laid out in the issue and pull request
template for proper description formatting. We use [GitHub Issues][] as
a bug tracker, and only accept code contributions in the form of GitHub
Pull Requests.

## License

The gem is available as open source under the terms of the [MIT License][].

[decorator]: https://en.wikipedia.org/wiki/Decorator_pattern
[Rails]: http://rubyonrails.org
[Draper]: http://github.com/drapergem/draper
[ActiveSupport]: https://github.com/rails/rails/tree/master/activesupport
[stdlib]: http://ruby-doc.org
[Delegator]: http://ruby-doc.org/stdlib-2.2.1/libdoc/delegate/rdoc/Delegator.html
[Enumerable]: http://ruby-doc.org/core-2.2.1/Enumerable.html
[Code of Conduct]: https://github.com/tubbo/makeover/master/CODE_OF_CONDUCT.md
[GitHub Issues]: https://github.com/tubbo/makeover/issues
[MIT License]: http://opensource.org/licenses/MIT
