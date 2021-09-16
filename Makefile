time-variation:
		mkdir -p dumps/timeVariation
		java src/Search.java \
				-P \
				-W 0 \
				-R 10 \
				Texts/shakespeare.txt "Something is rotten in the state of Denmark." \
				1 \
				> dumps/timeVariation/time_variation.txt

multiple-tasks-single-thread:
		mkdir -p dumps/multipleTaskSingleThread
		for number in 5 10 50 500 ; do \
						java src/Search.java \
								-W 5 \
								-R 10 \
								Texts/shakespeare.txt "Something is rotten in the state of Denmark." \
								$$number \
								> dumps/multipleTaskSingleThread/one_thread_tasks_$$number.txt ; \
		done

run-all:
	@$(MAKE) time-variation
	@$(MAKE) multiple-tasks-single-thread

delete:
	rm -rf dumps

