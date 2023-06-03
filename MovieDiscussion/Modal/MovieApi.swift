import Foundation

protocol MovieProtocol {
    func dataCollections(data : MovieDataCollections)
}

struct MovieApi {
    
    var delegate : MovieProtocol?
    
    func getData() {
        let movieUrl = "https://api.themoviedb.org/3/discover/movie?api_key=dce24a3d5cf21620db26f676ab057860"
        fetchData(movieUrl: movieUrl)
    }
    
    func fetchData(movieUrl : String) {
        let url = URL(string: movieUrl)!
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let e = error {
                print(e)
            }
            
            if let safeData = data {
                if let movieData = dataDecode(data: safeData) {
                    let movies = MovieDataCollections(results: movieData.results, title: "The Little Mermaid")
                    delegate?.dataCollections(data: movies)
                }
            }
        }
        task.resume()
    }
    
    func dataDecode(data : Data) -> MovieDecoder? {
        let decoder = JSONDecoder()
        
        do {
            let result =  try decoder.decode(MovieDecoder.self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }
}
 
