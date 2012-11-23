## undo in git
November 12, 2012
### Fixing un-committed mistakes
This will throw away any changes you may have added to the git index and as well as any outstanding changes you have in your working tree. In other words, it causes the results of "git diff" and "git diff --cached" to both be empty.

	$ git reset --hard HEAD

Fix one file:

	$ git checkout -- hello.rb
	$ git checkout HEAD hello.rb

### Fixing a mistake with a new commit

Creating a new commit that reverts an earlier change is very easy; just pass the git revert command a reference to the bad commit; for example, to revert the most recent commit:

	$ git revert HEAD

to revert the next-most recent commit:

	$ git revert HEAD^


