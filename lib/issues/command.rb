module Issues
  class Command
    attr_reader :args

    def initialize(*args)
      @args = args
    end

    def self.run(*args)
      new(*args).run
    end

    def run
      if ['--version', '-v'].include?(@args.first)
        puts Issues::VERSION
        exit(0)
      end
    end

  end
end
