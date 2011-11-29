# Shamelessly copied from:
# https://github.com/ryanb/dotfiles/
# https://github.com/holman/dotfiles/

require 'rake'

desc "Install dotfiles"
task :install => 'submodules' do
	Dir['*'].each do |file|
		next if %w[Rakefile Makefile].include?(file)
		target = "#{ENV["HOME"]}/.#{file}"
		if File.exists?(target) || File.symlink?(target)
			puts "File '#{target}' exists.  [s]kip or [o]verwrite?"
			case STDIN.gets.chomp
			when 'o' then overwrite = true
			when 's' then next
			end
			FileUtils.rm_rf(target) if overwrite
		end
		`ln -s "$PWD/#{file}" "#{target}"`
	end
end

task :submodules do
	sh %{git submodule update --rebase}
end

task :default => 'install'
