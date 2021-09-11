# Concurrent programming - assignment 1

## Run example (run from root directory): 
```java src/Search.java -W 5 -R 10 Texts/shakespeare.txt "Something is rotten in the state of Denmark." 8 8 "fixed"```

The first number after the pattern is the amounts of tasks and the next number is the amount of threads. 
The "fixed" arguments indicates the we use a newFixedThreadPool - the alternative would be "cached" which would then run using a newCachedThreadPool.
