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
      case @args.first when '-h', '--help', 'help', nil
        require 'cmd/help'
        puts Issues.help_s
        exit @args.first ? 0 : 1
      when '--version', '-v'
        puts Issues::VERSION
        exit 0
      end

      cmd = ARGV.shift
      if require? "cmd/#{cmd}"
        Issues.send cmd.to_s.gsub('-', '_')
      else
        $stderr.puts "Unknown command: #{cmd}"
        exit 1
      end
    end

    # thanks Homebrew!
    def require? path
      require path.to_s.chomp
    rescue LoadError => e
      raise unless e.to_s.include? path
    end

  end
end
