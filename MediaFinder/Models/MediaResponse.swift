//
//  ItuneModel.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 12/08/2022.
//

import Foundation

struct MediaResponse: Decodable{
    var resultCount: Int
    var results: [Media]
}

struct Media: Decodable{
    var artistName: String?
    var trackName: String?
    var artworkUrl: String!
    var previewUrl: String!
    var longDescription: String?
    
    enum CodingKeys: String, CodingKey{
        case artistName, trackName, previewUrl, longDescription
        case artworkUrl = "artworkUrl100"
    }
}
