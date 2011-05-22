module Issues
  class Tracker
    attr_reader :name

    def initialize(name, url, repo_path)
      @name = name
      @url = url
      @repo_path = repo_path
    end

    def save
      unless Dir.exists? dot_issues_repo_path
        Dir.mkdir dot_issues_repo_path
      end

      unless Dir.exists? tracker_path
        Dir.mkdir tracker_path

        File.open(tracker_path + "/url", "w") do |f|
          f.write @url
        end
      end
    end

    def make_current!
      File.delete("#{dot_issues_repo_path}/current") if File.exists?("#{dot_issues_repo_path}/current")
      File.symlink(tracker_path, "#{dot_issues_repo_path}/current")
    end

    def tracker_path
      @tracker_path ||= dot_issues_repo_path + "/" + @name
    end

    def dot_issues_repo_path
      @dot_issues_repo_path ||= ISSUES_DIR + "/" + repo_folder
    end

    def repo_folder
      @repo_folder ||= @repo_path[1..-1].gsub("/", ".")
    end
  end
end
