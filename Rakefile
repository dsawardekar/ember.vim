require 'rake/clean'
require 'find'

# helpers
def build_riml_path(dirs, pattern = /.*\.riml$/)
  libs = []
  dirs.each do |dir|
    Find.find(dir) do |path|
      if path =~ pattern
        libs << File.dirname(path)
      end
    end
  end

  libs.uniq.join(':')
end

# misc config
VERBOSE = ENV['VERBOSE'] || false
DEBUG = ENV['DEBUG'] || false

# build paths
BUILD_DIR = 'build'
# source paths
LIB_DIR = 'lib'
LIB_DIRS = build_riml_path([LIB_DIR])
PLUGIN_SOURCE = "#{LIB_DIR}/ember_plugin.riml"
PLUGIN_OUTPUT = "#{BUILD_DIR}/ember_plugin.vim"

# output paths
APP_SOURCE = "#{LIB_DIR}/ember.riml"
APP_OUTPUT = "#{BUILD_DIR}/ember.vim"

# test paths
TEST_DIR = 'spec'
TEST_LIB_DIRS = build_riml_path([TEST_DIR])

# speckle paths
SPECKLE_LIB_DIRS = "#{LIB_DIRS}:#{TEST_LIB_DIRS}"

# vim destinations
PLUGIN_DEST = "plugin/ember.vim"
APP_DEST = "autoload/ember.vim"

# clean task config
CLEAN.include("#{BUILD_DIR}/**/*.vim")
CLEAN.include("#{BUILD_DIR}/**/*.log")
CLEAN.include(PLUGIN_DEST)
CLEAN.include(APP_DEST)
CLOBBER.include(BUILD_DIR)

desc 'Default task :test'
task :default => :test

desc 'Build files and folders'
task :build do
  verbose VERBOSE do
    mkdir_p BUILD_DIR
  end
end

desc 'Compile plugin'
task :compile_plugin => :build do
  sh "bundle exec riml -c #{PLUGIN_SOURCE} -I #{LIB_DIRS} -o #{BUILD_DIR}"
end

desc 'Compile app'
task :compile_app => :build do
  sh "bundle exec riml -c #{APP_SOURCE} -I #{LIB_DIRS} -o #{BUILD_DIR}"
end

desc 'Compile all'
task :compile => [:compile_plugin, :compile_app]

desc 'Run all tests'
task :test => [:build] do
  sh "bundle exec speckle -a #{TEST_DIR} -I #{SPECKLE_LIB_DIRS} -r fivemat"
end

desc 'Move compiled files into vim directories'
task :dist => [:compile] do
  move_to PLUGIN_OUTPUT, PLUGIN_DEST
  move_to APP_OUTPUT, APP_DEST
end

def move_to(from, to)
  to_dir = File.dirname(to)
  to_name = File.basename(to)
  from_name = File.basename(from)

  mkdir_p to_dir
  mv from, to_dir

  new_from = "#{to_dir}/#{from_name}"
  new_to = "#{to_dir}/#{to_name}"

  unless new_from == new_to
    mv new_from, new_to
  end
end
