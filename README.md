# Rake::Sprockets

Very easy defaults for using sprockets through rake.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rake-asset-pipeline'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rake-asset-pipeline

## Usage

The default expected folder structure is:

    assets/
      js/app.js
      css/app.css
    public/

Build the assets with:

```sh
$ rake build
```

This will produce the following new files:

    public/assets/js/app.js
    public/assets/css/app.css

### Override defaults

These are the settings that can be overriden in your `Rakefile`:

#### Project root

The default is `Dir.pwd`.

```ruby
Rake::Sprockets.root = Pathname.new __dir__
```

#### logger

The default is `$stdout`.

```ruby
Rake::Sprockets.logger = Logger.new("log/output.log")
```

#### env

`#env` is set to `RAKE_ENV` or defaults to development.

`#env` is fancy and can answer queries:

```ruby
Rake::Sprockets.env.production?
```

Override from the shell:

```sh
$ RAKE_ENV=production rake build
```

#### precompile list

The default is to only compile `app.js` and `app.css`. You can add more
files:

```ruby
Rake::Sprockets.precompile += ["other.css", "cray.js"]
```

#### asset directories

The default asset directories are `assets/js` and `assets/css`. You can
change or add more:

```ruby
Rake::Sprockets.asset_paths = ["stylesheets", "javascripts"] # "assets/" is prepended
```

#### compression

In production compression is used if it's setup. You need to supply the
js and css compressors (there are no defaults):

```ruby
Rake::Sprockets.css_compressor = :sass
Rake::Sprockets.js_compressor  = :uglify
```

## Contributing

1. Fork it ( https://github.com/myobie/rake-sprockets/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
