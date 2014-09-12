require 'rake/sprockets/version'
require 'rake/sprockets/ey_string'
load 'tasks/sprockets.rake'

require 'logger'
require 'pathname'
require 'sprockets'

module Rake
  module Sprockets
    class << self
      attr_accessor :root, :logger, :precompile, :asset_paths, :js_compressor, :css_compressor

      def root
        @root ||= Pathname.new Dir.pwd
      end

      def env
        @env ||= ENV.fetch("RAKE_ENV", "development").ey?
      end

      def logger
        Logger.new $stdout
      end

      def precompile
        @precompile ||= ["app.js", "app.css"]
      end

      def asset_paths
        @asset_paths ||= ["css", "js"]
      end

      def public
        root.join "public"
      end

      def assets
        root.join "assets"
      end

      def public_assets
        public.join("assets")
      end

      def sprockets
        @sprockets ||= create_sprockets_env
      end

      def filename(file)
        asset = sprockets[file]

        if env.production?
          asset.digest_path
        else
          asset.logical_path
        end
      end

      def url(file)
        "/assets/#{filename(file)}"
      end

      def create_sprockets_env
        ::Sprockets::Environment.new(root) do |s_env|
          s_env.logger = logger

          if env.production?
            s_env.js_compressor = js_compressor if js_compressor
            s_env.css_compressor = css_compressor if css_compressor
          end
        end.tap do |s|
          asset_paths.each do |path|
            s.append_path assets.join(path)
          end
        end
      end

      def compile
        public_assets.mkpath
        precompile.each do |file|
          public_filename = public_assets.join filename(file)
          sprockets[file].write_to public_filename
        end
      end

      def clean
        public_assets.rmtree if public_assets.exist?
      end
    end
  end
end
