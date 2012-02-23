include Rake::DSL
require 'tools/rake_utils/library.rb'
require 'tools/rake_utils/tests.rb'

#------------------------------------------------------------------------------
# Configuration Objects
#------------------------------------------------------------------------------
# Configuration for the static library
CorkStatic = Library.new({
    :name => 'libcork.a',
    :compiler_options => [ '-c', '-Wall', '-Werror', '-o' ],
    :source_files => [ 'source/**/*.c*' ],
    :include_dirs => [ 'source/**/' ],
})
CorkStatic.setup_default_rake_tasks()

# Configuration for the shared library
CorkShared = Library.new({
    :name => 'libcork.so',
    :compiler_options => [ '-c', '-Wall', '-Werror', '-fPIC', '-o' ],
    :linker_bin => 'c++',
    :linker_options => ['-shared', '-o'],
    :source_files => [ 'source/**/*.c*' ],
    :include_dirs => [ 'source/**/' ],
})
CorkShared.setup_default_rake_tasks()

# Configuration for the unit tests
UnitTest = Tests.new({
    :test_files => [ 'tests/source/**.h' ],
})
UnitTest.setup_default_rake_tasks()

#------------------------------------------------------------------------------
# Rake Tasks
#------------------------------------------------------------------------------
desc 'Execute a complete build including unit tests and binary'
task :default => [ :release ]

desc 'Build and link the static library'
task :release => [ CorkStatic.name(), CorkShared.name() ]

desc 'Display build configuration info'
task :config do
    puts 'Static Library Configuration'
    puts '----------------------------'
    puts CorkStatic
    puts ''
    puts 'Shared Library Configuration'
    puts '----------------------------'
    puts CorkShared
    puts ''
    puts 'Unit Test Configuration'
    puts '-----------------------'
    puts UnitTest
end

