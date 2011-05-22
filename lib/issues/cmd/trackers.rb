module Issues extend self
  def trackers
    repo_path = find_repo_or_exit

    begin
      repo = Repo.new(repo_path)
    rescue RepoNotFoundError
      $stderr.puts "fatal: Looks like you haven't run `issues init` inside this git repository"
      exit 1
    end

    repo.trackers.each do |tracker|
      if tracker.current?
        print "* #{tracker.name}"
      else
        print "  #{tracker.name}"
      end
    end
  end
end
