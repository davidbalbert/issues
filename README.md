issues: a command line interface to github issues with offline support
======================================================================

Proposed usage
--------------

    $ issues init                                   # initializes an issue tracker for each github remote
    $ issues trackers                               # lists issue trackers
    $ issues use <tracker>                          # sets the active issue tracker to be "tracker"
    $ issues pull                                   # pulls latest issue info from each remote tracker
    $ issues push                                   # pushes local issue updates to remote tracker
    $ issues status                                 # pushes
    $ issues ls                                     # lists open issues
    $ issues ls --all                               # lists all issues
    $ issues ls --mine                              # lists all issues that are assigned to me
    $ issues ls --closed                            # lists all closed issues
    $ issues ls <label>                             # lists all issues labeled with "label"
    $ issues label                                  # lists all labels
    $ issues show <issue_number>                    # shows issue description
    $ issues log <issue_number>                     # shows all comments on the given issue including the discription
    $ issues comment <issue_number>                 # opens $EDITOR and lets you comment on an issue
    $ issues comment <issue_number> -m <message>    # same as above but supply comment inline
    $ issues close <issue_number>                   # same as `$ issues comment`, but also closes the issue
    $ issues close <issue_number> -m <message>      # same as above but supply comment inline
