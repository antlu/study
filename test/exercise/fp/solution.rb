module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(films)
        ratings = films.filter { |film| film['country'] && film['country'].split(',').size > 1 }
                       .map { |film| film['rating_kinopoisk'].to_f }
                       .filter(&:positive?)

        ratings.reduce(&:+) / ratings.size
      end

      def chars_count(films, threshold)
        films.select { |film| film['rating_kinopoisk'] && film['rating_kinopoisk'].to_f >= threshold }
             .reduce(0) { |sum, film| sum + film['name'].count('и') }
      end
    end
  end
end
