# Import required library
from pyspark.ml.feature import OneHotEncoder, StringIndexer, VectorAssembler, Normalizer
from pyspark.ml import Pipeline
from pyspark.sql import SparkSession
from pyspark import SparkContext, SparkConf
 
if __name__ == "__main__":

    # Starting SparkSession
    spark = SparkSession.builder\
            .master("local")\
            .appName("FeatureEngineering")\
            .config('spark.ui.port', '4050')\
            .config("spark.driver.memory", "6g")\
            .getOrCreate()

    # Read csv 
    df = spark.read.options(inferSchema='True', header='True', delimiter=',') \
                .csv("hdfs://127.0.0.1:9000/tmp/cvas_data.csv")

    # String Indexer
    indexer = StringIndexer(inputCol="term", outputCol="termIndex")
    model = indexer.fit(df)
    indexed = model.transform(df)

    # Encoder
    encoder = OneHotEncoder(inputCol="termIndex", outputCol="termVec")
    encoded = encoder.fit(indexed).transform(indexed)

    # Assembler 
    assembler = VectorAssembler(inputCols=["amount", "fee", "annual_income"], outputCol="feature_vectorized")
    feature_vectorized = assembler.transform(encoded)

    # Normalize each Vector using $L^1$ norm.
    normalizer = Normalizer(inputCol="feature_vectorized", outputCol="features_norm", p=1.0)
    l1NormData = normalizer.transform(feature_vectorized)

    # Pipeline 
    pipeline = Pipeline(stages=[indexer, encoder, assembler, normalizer])
    model = pipeline.fit(df)
    prediction = model.transform(df)
    df_train = prediction.drop('amount').drop('fee').drop('term').drop('annual_income')

    # Write df for training in parque to hfds 
    df_train.write.parquet("hdfs://127.0.0.1:9000/tmp/cvas_data.parquet")