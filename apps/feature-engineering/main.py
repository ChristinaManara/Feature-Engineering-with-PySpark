# Import required library
from pyspark.ml.feature import OneHotEncoder, StringIndexer, VectorAssembler, Normalizer
from pyspark.ml import Pipeline
from pyspark.sql import SparkSession

import sys
 
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
                .csv("cvas_data.csv")

    """StringIndexer"""

    indexer = StringIndexer(inputCol="term", outputCol="termIndex")

    #Fits a model to the input dataset with optional parameters.
    model = indexer.fit(df)
    indexed = model.transform(df)
    #indexed.show()

    encoder = OneHotEncoder(inputCol="termIndex", outputCol="termVec")
    encoded = encoder.fit(indexed).transform(indexed)

    #encoded.show()

    assembler = VectorAssembler(inputCols=["amount", "fee", "annual_income"], outputCol="feature_vectorized")
    feature_vectorized = assembler.transform(encoded)

    #feature_vectorized.show()

    # Normalize each Vector using $L^1$ norm.
    normalizer = Normalizer(inputCol="feature_vectorized", outputCol="features_norm", p=1.0)
    l1NormData = normalizer.transform(feature_vectorized)

    #l1NormData.show()

    pipeline = Pipeline(stages=[indexer, encoder, assembler, normalizer])

    model = pipeline.fit(df)

    prediction = model.transform(df)

    #prediction.show()

    df_train = prediction.drop('amount').drop('fee').drop('term').drop('annual_income')

    #df_train.show()

    df_train.write.parquet("cvas_data.parquet")