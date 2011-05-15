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
