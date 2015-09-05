# EngawaEater

When you want to eat '炙りえんがわ' , you can get a sense of satisfaction when you play this game.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'engawa_eater'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install engawa_eater

## Usage

### example
```
$ engawa_eater only
  eat only '炙りえんがわ'（e:eat, p:pass）
  えんがわ
  p
  炙りサーモン
  p
  炙りエンガワ
  e
  ...
```
Aim a perfect score!

```
$ engawa_eater many
  Game of continue to eat 'えんがわ' and '炙りえんがわ'.
  炙りえんがわ（SCORE:0, STOMACH:0）
  e
  サーモン（SCORE:3, STOMACH:4）
  p
  えんがわ（SCORE:3, STOMACH:4）
  e
  芽ねぎ（SCORE:4, STOMACH:6）
  e
  えんがわ（SCORE:4, STOMACH:6）
  ...
```
Aim high score!

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment. Run `bundle exec engawa_eater` to use the gem in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/engawa_eater. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

