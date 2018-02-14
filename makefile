all: readme
readme:
	touch readme.md
	echo "# Peer-graded Assignment: Bash, Make, Git, and GitHub" > readme.md
	echo "* Make was last run on: `date +%c`">>readme.md
	echo "* The number of lines in guessingame.sh is: $$(cat  guessinggame.sh | wc -l)">>readme.md
