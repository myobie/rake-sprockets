namespace :assets do
  desc "Build all assets into public"
  task :compile do
    Rake::Sprockets.compile
  end

  desc "Remove all asset files in public"
  task :clean do
    Rake::Sprockets.clean
  end
end
