desc "Build all assets into public"
task :build do
  Rake::Sprockets.compile
end

task :compile => :build

desc "Remove all asset files in public"
task :clean do
  Rake::Sprockets.clean
end
