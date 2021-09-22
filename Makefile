time-variation:
		mkdir -p dumps
		touch dumps/timeVariation.txt
		echo timeVariation >> dumps/timeVariation.txt
		java src/Search.java \
				-ps \
				-W 0 \
				-R 20 \
				Texts/shakespeare.txt "Something is rotten in the state of Denmark." \
				1 \
				>> dumps/timeVariation.txt
		sed -i 's/\./,/g' dumps/timeVariation.txt

no-jit:
		mkdir -p dumps
		touch dumps/noJit.txt
		echo noJit >> dumps/noJit.txt
		java -Xint src/Search.java \
				-ps \
				-W 0 \
				-R 10 \
				Texts/shakespeare.txt "Something is rotten in the state of Denmark." \
				1 \
				>> dumps/noJit.txt
		sed -i 's/\./,/g' dumps/noJit.txt

multiple-tasks-single-thread:
		mkdir -p dumps
		touch dumps/multipleTaskSingleThread.txt
		echo tasks threads avgTimeMulti avgTimeSingle avgSpeedUp multipleTaskSingleThread >> dumps/multipleTaskSingleThread.txt
		for number in 5 10 50 4000 8000 ; do \
						java src/Search.java \
								-W 5 \
								-R 5 \
								Texts/shakespeare.txt "Something is rotten in the state of Denmark." \
								$$number \
								>> dumps/multipleTaskSingleThread.txt ; \
		done
		sed -i 's/\./,/g' dumps/multipleTaskSingleThread.txt

cached-thread-pool:
		mkdir -p dumps
		touch dumps/cachedThreadPool.txt
		echo tasks threads avgTimeMulti avgTimeSingle avgSpeedUp cachedThreadPool >> dumps/cachedThreadPool.txt
		for number in 1 4 6 8 10 12 14 16 18 20 25 40 60 100 ; do \
						java src/Search.java \
								-W 5 \
								-R 5 \
								Texts/shakespeare.txt "Something is rotten in the state of Denmark." \
								$$number \
								1 \
								"cached" \
								>> dumps/cachedThreadPool.txt ; \
		done
		sed -i 's/\./,/g' dumps/cachedThreadPool.txt 

2-tasks-fixed:
		mkdir -p dumps
		touch dumps/twoTasksFixedVariedThread.txt
		echo tasks threads avgTimeMulti avgTimeSingle avgSpeedUp twoTasksFixedVariedThread >> dumps/twoTasksFixedVariedThread.txt
		for number in 1 2 6 12 20 ; do \
						java src/Search.java \
								-W 5 \
								-R 5 \
								Texts/shakespeare.txt "Something is rotten in the state of Denmark." \
								2 \
								$$number \
								"fixed" \
								>> dumps/twoTasksFixedVariedThread.txt ; \
		done
		sed -i 's/\./,/g' dumps/twoTasksFixedVariedThread.txt 

8-tasks-fixed:
		mkdir -p dumps
		touch dumps/eightTasksFixedVariedThread.txt
		echo tasks threads avgTimeMulti avgTimeSingle avgSpeedUp eightTasksFixedVariedThread >> dumps/eightTasksFixedVariedThread.txt
		for number in 4 8 10 20 30 ; do \
						java src/Search.java \
								-W 5 \
								-R 5 \
								Texts/shakespeare.txt "Something is rotten in the state of Denmark." \
								8 \
								$$number \
								"fixed" \
								>> dumps/eightTasksFixedVariedThread.txt ; \
		done
		sed -i 's/\./,/g' dumps/eightTasksFixedVariedThread.txt 

30-tasks-fixed:
		mkdir -p dumps
		touch dumps/thirtyTasksFixedVariedThread.txt
		echo tasks threads avgTimeMulti avgTimeSingle avgSpeedUp thirtyTasksFixedVariedThread >> dumps/thirtyTasksFixedVariedThread.txt
		for number in 4 8 12 30 50 ; do \
						java src/Search.java \
								-W 5 \
								-R 5 \
								Texts/shakespeare.txt "Something is rotten in the state of Denmark." \
								30 \
								$$number \
								"fixed" \
								>> dumps/thirtyTasksFixedVariedThread.txt ; \
		done
		sed -i 's/\./,/g' dumps/thirtyTasksFixedVariedThread.txt 

split-test:
		mkdir -p dumps
		touch dumps/splitTest.txt
		echo splitTest >> dumps/splitTest.txt
				java src/Search.java \
						-W 5 \
						-R 2 \
						Texts/xtest.txt "xxxx" \
						5 \
						1 \
						"cached" \
						>> dumps/splitTest.txt
		sed -i 's/\./,/g' dumps/splitTest.txt 

# HPC stuff
8-tasks-fixed-hpc:
		mkdir -p dumps
		touch dumps/eightTasksFixedVariedThreadHpc.txt
		echo tasks threads avgTimeMulti avgTimeSingle avgSpeedUp eightTasksFixedVariedThreadHpc >> dumps/eightTasksFixedVariedThreadHpc.txt
		for number in 4 8 10 20 30 ; do \
						java src/Search.java \
								-W 5 \
								-R 5 \
								Texts/shakespeare.txt "Something is rotten in the state of Denmark." \
								8 \
								$$number \
								"fixed" \
								>> dumps/eightTasksFixedVariedThreadHpc.txt ; \
		done
		sed -i 's/\./,/g' dumps/eightTasksFixedVariedThreadHpc.txt 

30-tasks-fixed-hpc:
		mkdir -p dumps
		touch dumps/thirtyTasksFixedVariedThreadHpc.txt
		echo tasks threads avgTimeMulti avgTimeSingle avgSpeedUp thirtyTasksFixedVariedThreadHpc >> dumps/thirtyTasksFixedVariedThreadHpc.txt
		for number in 4 8 12 30 50 ; do \
						java src/Search.java \
								-W 5 \
								-R 5 \
								Texts/shakespeare.txt "Something is rotten in the state of Denmark." \
								30 \
								$$number \
								"fixed" \
								>> dumps/thirtyTasksFixedVariedThreadHpc.txt ; \
		done
		sed -i 's/\./,/g' dumps/thirtyTasksFixedVariedThreadHpc.txt 

cached-thread-pool-hpc:
		mkdir -p dumps
		touch dumps/cachedThreadPoolHpc.txt
		echo tasks threads avgTimeMulti avgTimeSingle avgSpeedUp cachedThreadPoolHpc >> dumps/cachedThreadPoolHpc.txt
		for number in 1 4 6 8 10 12 14 16 18 20 25 40 60 100 ; do \
						java src/Search.java \
								-W 5 \
								-R 5 \
								Texts/shakespeare.txt "Something is rotten in the state of Denmark." \
								$$number \
								1 \
								"cached" \
								>> dumps/cachedThreadPoolHpc.txt ; \
		done
		sed -i 's/\./,/g' dumps/cachedThreadPoolHpc.txt 

run-all:
	@$(MAKE) time-variation
	@$(MAKE) no-jit
	@$(MAKE) multiple-tasks-single-thread
	@$(MAKE) cached-thread-pool
	@$(MAKE) 2-tasks-fixed
	@$(MAKE) 8-tasks-fixed
	@$(MAKE) 30-tasks-fixed
	@$(MAKE) split-test

run-all-hpc:
	@$(MAKE) 8-tasks-fixed-hpc
	@$(MAKE) 30-tasks-fixed-hpc
	@$(MAKE) cached-thread-pool-hpc

delete:
	rm -rf dumps

copy:
	mkdir -p results
	cp -r dumps/* results/

