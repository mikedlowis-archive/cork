require "#{File.expand_path(File.dirname(__FILE__))}/artifact"
require 'rake'
require 'rake/clean'

class Library < Artifact
    def initialize(config)
        super(config)

        # Register output directories
        register_directory("#{@settings[:output_dir]}/bin")
        register_directory("#{@settings[:output_dir]}/obj")

        # set output name
        @settings[:name] = "#{@settings[:output_dir]}/bin/#{@settings[:name]}"
        CLEAN.include(@settings[:name])

        # Create object file list
        @settings[:object_source_lookup] = {}
        @settings[:object_files] = []
        @settings[:source_files].each{ |f|
            obj_file = @settings[:output_dir] + '/obj/' + File.basename(f).ext('o')
            CLEAN.include(obj_file)
            @settings[:object_files].push( obj_file )
            @settings[:object_source_lookup][obj_file] = f
        }
    end

    def defaults()
        return {
            :name => 'binary',
            :output_dir => 'build',

            :compiler_bin => 'c++',
            :compiler_options => ['-c'],
            :preprocessor_defines => [],

            :linker_bin => 'ar',
            :linker_options => ['rcs'],

            :source_files => [ 'source/**/*.c*' ],
            :include_dirs => [ 'source/**/' ],
            :directories => []
        }
    end

    def name()
        return @settings[:name]
    end

    def objects()
        return @settings[:object_files]
    end

    def source_from_obj(obj)
        return @settings[:object_source_lookup][obj]
    end

    def obj_src_lookup()
        return lambda{|obj| @settings[:object_source_lookup][obj]}
    end

    def setup_default_rake_tasks()
        task name() => directories() + objects() do
            link()
        end

        rule(/obj\/.+.o$/ => obj_src_lookup()) do |t|
            compile(t.source,t.name)
        end
    end
end
