---
layout: post
title: "Git Bisecting Files in a Single Commit"
date: 2016-11-30 18:27:19
comments: false
share: false
tags: [git]
---

I have sometimes wanted to run git bisect on all of the files in a single commit to determine which file caused a given issue.
While this isn't supported by git (for good reason), it's easy enough to fake. 

This happened recently when I made a global typography change in a rails project, causing a feature spec (which depended on a specific
string format) to fail.

```bash
# Create a new branch, based on a working commit
git checkout -b bisect-debugging <working-commit>
# Apply the changes from the broken commit
git cherry-pick <broken-commit> --no-commit
# Unstage the changes from the commit
git reset
# Loop through modified files, adding and committing each
# To include new files, you could also use `git ls-files -om --exclude-standard` 
for file in $(git ls-files -m); do
  git add $file
  git commit -m $file
done
# Begin bisecting for your new commits
git bisect start <working-commit> HEAD
# Use the failing spec to determine whether this commit is good or bad
git bisect run bundle exec rspec spec/failing_test.rb:123
```

