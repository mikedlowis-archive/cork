include Rake::DSL
require 'tools/rake_utils/source/library'
require 'tools/rake_utils/source/tests'

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
    :compiler_options => [ '-c', '-Wall', '-Werror', '-o' ],
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

