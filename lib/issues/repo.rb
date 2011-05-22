module Issues
  class RepoNotFoundError < StandardError; end

  class Repo
    def initialize(repo_path)
      raise RepoNotFoundError unless Dir.exists?( ISSUES_DIR + "/" + repo_path[1..-1].gsub("/", "."))
    end

    def trackers
      @trackers ||= []
      abort "Y U NO IMPLEMENT REPO#TRACKERS?! TOO TIRED TROLOLOL?"
    end
  end
end

