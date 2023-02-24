mkdir with_rebase                         # create a directory for merging with rebase (git merge --rebase main)
pushd with_rebase                         # move into the with_rebase directory
git init                                  # initialize the with_rebase directory as a git repo
git checkout -b main                      # create and checkout the main branch
echo '*.c merge=union' > .gitattributes   # add an git attributes file to tell merge to except both changes by default
echo '// init commit' > test.c            # add a test.c file with comment `// init commit`
git add test.c .gitattributes             # add the test.c and .gitattributes file to the git branch main
git commit -m 'init commit'               # commit our changes to main with message 'init commit'
git checkout -b feature/A                 # branch off main into a new branch 'feature/A'
echo '// feature/A work' >> test.c        # write a new line to test.c
git commit -am 'feature/A work'           # add and commit our changes to 'feature/A' with message 'feature/A work'
git checkout main                         # branch back to main
git checkout -b feature/C                 # branch off main into a new branch 'feature/C'
echo '// feature/C work' >> test.c        # write a new line to test.c
git commit -am 'feature/C work'           # add and commit our changes to 'feature/C' with message 'feature/C work'
git checkout main                         # branch back to main
git checkout -b feature/B                 # branch off main into a new branch 'feature/B'
echo '// feature/B work' >> test.c        # write a new line to test.c
git commit -am 'feature/B work'           # add and commit our changes to 'feature/B' with message 'feature/B work'
git checkout feature/A                    # branch back to feature/A
git rebase main --merge                   # rebase main into feature/A
git checkout main                         # branch back to main
git merge feature/A                       # merge feature/A into main 
git commit -am 'merge feature/A'          # commit the merge
git checkout feature/C                    # branch back to feature/C
git rebase main --merge                   # reabase main into feature/C
git checkout main                         # branch back to main
git merge feature/C                       # merge feature/C into main 
git commit -am 'merge feature/C'          # commit the merge
git checkout -b feature/D                 # branch off main into a new branch 'feature/B'
echo '// feature/D work' >> test.c        # write a new line to test.c
git commit -am 'feature/D work'           # add and commit our changes to 'feature/D' with message 'feature/D work'
git checkout feature/B                    # branch back to main
git rebase main --merge                   # reabase main into feature/B
git checkout main                         # branch back to main
git merge feature/B                       # merge feature/B into main 
git commit -am 'merge feature/B'          # commit the merge
git checkout feature/D                    # branch back to feature/D
git rebase main --merge                   # reabase main into feature/D
git checkout main                         # branch back to main
git merge feature/D                       # merge feature/D into main 
git commit -am 'merge feature/D'          # commit the merge
popd                                      # back into the directory started in

mkdir without_rebase                      # create a directory for merging with squash (git merge --squash main)
pushd without_rebase                      # move into the without_rebase directory
git init                                  # initialize the without_rebase directory as a git repo
git checkout -b main                      # create and checkout the main branch
echo '*.c merge=union' > .gitattributes   # add an git attributes file to tell merge to except both changes by default
echo '// init commit' > test.c            # add a test.c file with comment `// init commit`
git add test.c .gitattributes             # add the test.c and .gitattributes file to the git branch main
git commit -m 'init commit'               # commit our changes to main with message 'init commit'
git checkout -b feature/A                 # branch off main into a new branch 'feature/A'
echo '// feature/A work' >> test.c        # write a new line to test.c
git commit -am 'feature/A work'           # add and commit our changes to 'feature/A' with message 'feature/A work'
git checkout main                         # branch back to main
git checkout -b feature/C                 # branch off main into a new branch 'feature/C'
echo '// feature/C work' >> test.c        # write a new line to test.c
git commit -am 'feature/C work'           # add and commit our changes to 'feature/C' with message 'feature/C work'
git checkout main                         # branch back to main
git checkout -b feature/B                 # branch off main into a new branch 'feature/B'
echo '// feature/B work' >> test.c        # write a new line to test.c
git commit -am 'feature/B work'           # add and commit our changes to 'feature/B' with message 'feature/B work'
git checkout main                         # branch back to main
git merge feature/A --no-commit           # merge feature/A into main
git commit -am 'merge feature/A'          # commit the merge
git merge feature/C --no-commit           # merge feature/C into main
git commit -am 'merge feature/C'          # commit the merge
git checkout -b feature/D                 # branch off main into a new branch 'feature/B'
echo '// feature/D work' >> test.c        # write a new line to test.c
git commit -am 'feature/D work'           # add and commit our changes to 'feature/D' with message 'feature/D work'
git checkout main                         # branch back to main
git merge feature/B --no-commit           # merge feature/B into main
git commit -am 'merge feature/B'          # commit the merge
git merge feature/D --no-commit           # merge feature/D into main 
git commit -am 'merge feature/D'          # commit the merge
popd                                      # back into the directory started in

mkdir with_squash                         # create a directory for merging with squash (git merge --squash main)
pushd with_squash                         # move into the with_squash directory
git init                                  # initialize the with_squash directory as a git repo
git checkout -b main                      # create and checkout the main branch
echo '*.c merge=union' > .gitattributes   # add an git attributes file to tell merge to except both changes by default
echo '// init commit' > test.c            # add a test.c file with comment `// init commit`
git add test.c .gitattributes             # add the test.c and .gitattributes file to the git branch main
git commit -m 'init commit'               # commit our changes to main with message 'init commit'
git checkout -b feature/A                 # branch off main into a new branch 'feature/A'
echo '// feature/A work' >> test.c        # write a new line to test.c
git commit -am 'feature/A work'           # add and commit our changes to 'feature/A' with message 'feature/A work'
git checkout main                         # branch back to main
git checkout -b feature/C                 # branch off main into a new branch 'feature/C'
echo '// feature/C work' >> test.c        # write a new line to test.c
git commit -am 'feature/C work'           # add and commit our changes to 'feature/C' with message 'feature/C work'
git checkout main                         # branch back to main
git checkout -b feature/B                 # branch off main into a new branch 'feature/B'
echo '// feature/B work' >> test.c        # write a new line to test.c
git commit -am 'feature/B work'           # add and commit our changes to 'feature/B' with message 'feature/B work'
git checkout main                         # branch back to main
git merge --squash feature/A              # merge feature/A into main and squash the commits
git commit -am 'merge feature/A'          # commit the merge
git merge --squash feature/C              # merge feature/C into main and squash the commits
git commit -am 'merge feature/C'          # commit the merge
git checkout -b feature/D                 # branch off main into a new branch 'feature/B'
echo '// feature/D work' >> test.c        # write a new line to test.c
git commit -am 'feature/D work'           # add and commit our changes to 'feature/D' with message 'feature/D work'
git checkout main                         # branch back to main
git merge --squash feature/B              # merge feature/B into main and squash the commits
git commit -am 'merge feature/B'          # commit the merge
git merge --squash feature/D              # merge feature/D into main and squash the commits
git commit -am 'merge feature/D'          # commit the merge
popd                                      # back into the directory started in