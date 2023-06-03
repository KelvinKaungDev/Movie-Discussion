//
//  MovieDataCollections.swift
//  MovieDiscussion
//
//  Created by Kaung Htet OO on 6/3/23.
//

import Foundation

struct MovieDataCollections {
    var results : [Results]
    var title : String
    
    func result() -> Int {
        let filter = results.map{$0.title}
        return filter.firstIndex(of: title) ?? 1
    }
}
