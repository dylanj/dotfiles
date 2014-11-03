#!/usr/bin/env ruby

# .gitmodule generator
# maybe i'm retarded but i couldn't figure out how to get git to
# spit out a list of submodules for nested git repos. this super
# simple script will spit out a valid .gitmodules to stdout. it
# doesn't do anything fancy, it's not recursive. it's pretty basic
#
# example:
# cd ~/some/repo
# ruby gitmodulegen.rb path/to/modules

require 'pry'

orig = Dir.pwd
path = ARGV[0]
repo_regexp = /origin\t(?<repo>\S*)/

def build_submodule(path, url)
  path = path.gsub(/^.\//,'')

  puts %[[submodule "#{path}"]]
  puts %[  path = #{path}]
  puts %[  url = #{url}]
  puts ""
end

Dir.entries(path).each do |file_name|
  file_path = "#{path}/#{file_name}"
  next if file_name == ".." || file_name == "."

  if File.directory?(file_path)
    Dir.chdir(file_path) do
      matches = repo_regexp.match(`git remote -v`)

      build_submodule(file_path, matches[:repo])
    end
  end
end


