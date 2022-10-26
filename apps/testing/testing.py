# Create SparkSession and sparkcontext
from pyspark.sql import SparkSession

if __name__ == "__main__":
    
    spark = SparkSession.builder\
                        .master("local")\
                        .appName("FeatureEngineering")\
                        .config('spark.ui.port', '4050')\
                        .config("spark.driver.memory", "6g")\
                        .getOrCreate()
    
    sc = spark.sparkContext

    # Read the input file and Calculating words count
    text_file = sc.textFile("hdfs://127.0.0.1:9000/tmp/WordCount.txt")
    counts = text_file.flatMap(lambda line: line.split(" ")) \
                                .map(lambda word: (word, 1)) \
                            .reduceByKey(lambda x, y: x + y)

    output = counts.collect()
    for (word, count) in output:
        print("%s: %i" % (word, count))
    # Write df for training in parque to hfds 
    counts.saveAsTextFile("hdfs://127.0.0.1:9000/tmp/output_wc.txt")