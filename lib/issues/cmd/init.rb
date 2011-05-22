module Issues extend self
  def init
    repo_dir = find_git_repo
    unless repo_dir
      $stderr.puts "Couldn't find a git repo in #{Dir.pwd}"
      exit 1
    end

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

  def find_git_repo
    pwd = Dir.pwd
    while true do
      if Dir.pwd == "/"
        Dir.chdir pwd
        return nil
      elsif Dir.exists? ".git"
        git_dir = Dir.pwd
        Dir.chdir pwd
        return git_dir
      end
      Dir.chdir ".."
    end
  end
end
