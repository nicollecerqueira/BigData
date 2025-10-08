from mrjob.job import MRJob
from mrjob.step import MRStep

class MovieRatingsCounter(MRJob):
    def steps(self):
        return [
            MRStep(
                mapper=self.mapper_extract_movies,
                reducer=self.reducer_count_ratings
            ),
            MRStep(
                mapper=self.mapper_prepare_for_sorting,
                reducer=self.reducer_output_sorted_results,
                jobconf={
                    'mapreduce.job.reduces': '1',
                    'stream.num.map.output.key.fields': '1',
                    'mapreduce.partition.keycomparator.options': '-k1,1nr'
                }
            )
        ]

    # Processa o arquivo u.data: user_id \t movie_id \t rating \t timestamp
    def mapper_extract_movies(self, _, linha):
        campos = linha.strip().split('\t')
        if len(campos) >= 2:
            id_filme = campos[1]
            yield id_filme, 1

    def reducer_count_ratings(self, id_filme, contadores):
        yield id_filme, sum(contadores)

    def mapper_prepare_for_sorting(self, id_filme, total_avaliacoes):
        yield int(total_avaliacoes), id_filme

    def reducer_output_sorted_results(self, total_avaliacoes, ids_filmes):
        for id_filme in ids_filmes:
            yield total_avaliacoes, id_filme

if __name__ == '__main__':
    MovieRatingsCounter.run()
