module Issues extend self
  def init
    repo_dir = find_repo_or_exit

    unless Dir.exists? ISSUES_DIR
      Dir.mkdir ISSUES_DIR
    end

    repo = Grit::Repo.new(repo_dir)

    remotes = Hash[repo.config.keys.map do |key|
      if key =~ /^remote\.(\w+)\.url$/
        [$1, repo.config[key]]
      else
        nil
      end
    end.compact]

    gh_remotes = remotes.select { |name, url| url.include? "github.com" }

    if gh_remotes.size == 0
      $stderr.puts "No github remotes found in #{Dir.pwd}"
      exit 1
    end

    trackers = []
    gh_remotes.each do |name, url|
      trackers << tracker = Tracker.new(name, url, repo_dir)
      tracker.save
    end

    current = trackers.select { |t| t.name == "origin" }[0] || trackers[0]
    current.make_current!
  end
end
