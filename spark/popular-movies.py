from pyspark import SparkConf, SparkContext

def loadMovieNames():
    movieNames = {}
    with open("ml-100k/u.ITEM", encoding="ISO-8859-1") as f:
        for line in f:
            fields = line.split('|')
            movieNames[int(fields[0])] = fields[1]
    return movieNames

conf = SparkConf().setMaster("local").setAppName("PopularMovies")
sc = SparkContext(conf = conf)
nameDict = sc.broadcast(loadMovieNames())

lines = sc.textFile("file:///ml-100k/u.data")
movies = lines.map(lambda x : (int(x.split()[1]), 1) )
movieCounts = movies.reduceByKey(lambda x, y: x + y)

flipped = movieCounts.map(lambda x : (x[1], x[0]))
sortedMovies = flipped.sortByKey()
sortedMovies = sortedMovies.map(lambda movie_count : (nameDict.value[movie_count[1]], movie_count[0]))

results = sortedMovies.collect()
for result in results:
    print(result)
