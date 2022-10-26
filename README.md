# Feature-Engineering-with-PySpark

## Hadoop Single Node Cluster on Docker.

## Description

The objective of this assignment is to implement a distributed system that handles csv data, applies transformations and feature engineering and persists them in parquet format. The system should consist of the
following two modules:

1. A distributed file system (Hadoop cluster) where the csv dataset-file will be stored and the resulting parquet files will be persisted.
2. A spark cluster that will run on top of Hadoop and will process the csv data in order to generate new features that will be stored in parquet files.

## Getting Started

### Dependencies

* Docker has to be installed. 

### Installing

* This is a private git for personal purposes. 
* Any modifications needed to be made to files/folders

### Executing program

* Download this repository with the command:
```
 git clone https://github.com/ChristinaManara/Feature-Engineering-with-PySpark.git
```

* Navigate to the downloaded repository with the command: 
```
cd pathTo/Feature-Engineering-with-PySpark
```

* Build containers with the command:
```
bash build_all.sh
```

* Deploy an HDFS-Spark cluster with the command:
```
docker-compose up -d
```

You can submit a Word Count or Feature Engineering job with:
* Navigate to apps folder with the command:  
```
cd apps
```
* Run the command and a menu will be shown:
 ```
bash run.sh
```

![alt text](https://github.com/ChristinaManara/Feature-Engineering-with-PySpark/blob/main/images/terminal.png)

## Help

Any advise for common problems or issues.
```
command to run if program contains helper info
```

## Authors

Contributors names and contact info

ex. Dominique Pizzie  
ex. [@DomPizzie](https://twitter.com/dompizzie)

## Version History

* 0.2
    * Various bug fixes and optimizations
    * See [commit change]() or See [release history]()
* 0.1
    * Initial Release

## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details

## Acknowledgments

Inspiration, code snippets, etc.
* [awesome-readme](https://github.com/matiassingers/awesome-readme)
* [PurpleBooth](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)
* [dbader](https://github.com/dbader/readme-template)
* [zenorocha](https://gist.github.com/zenorocha/4526327)
* [fvcproductions](https://gist.github.com/fvcproductions/1bfc2d4aecb01a834b46)
