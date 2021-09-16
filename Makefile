time-variation:
		mkdir -p dumps
		touch dumps/timeVariation.txt
		echo timeVariation >> dumps/timeVariation.txt
		java src/Search.java \
				-ps \
				-W 0 \
				-R 10 \
				Texts/shakespeare.txt "Something is rotten in the state of Denmark." \
				1 \
				>> dumps/timeVariation.txt
		sed -i 's/\./,/g' dumps/timeVariation.txt

multiple-tasks-single-thread:
		mkdir -p dumps
		touch dumps/multipleTaskSingleThread.txt
		echo tasks threads avgTimeMulti avgTimeSingle avgSpeedUp multipleTaskSingleThread >> dumps/multipleTaskSingleThread.txt
		for number in 5 10 50 500 ; do \
						java src/Search.java \
								-W 5 \
								-R 10 \
								Texts/shakespeare.txt "Something is rotten in the state of Denmark." \
								$$number \
								>> dumps/multipleTaskSingleThread.txt ; \
		done
		sed -i 's/\./,/g' dumps/multipleTaskSingleThread.txt

run-all:
	@$(MAKE) time-variation
	@$(MAKE) multiple-tasks-single-thread

delete:
	rm -rf dumps

