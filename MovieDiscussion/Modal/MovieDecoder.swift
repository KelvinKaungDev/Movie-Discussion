import Foundation

struct MovieDecoder : Codable {
    var results : [Results]
}

struct Results : Codable {
    var id : Int
    var title : String
    var poster_path : String
}
