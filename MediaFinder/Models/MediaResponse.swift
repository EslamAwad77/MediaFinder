//
//  ItuneModel.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 12/08/2022.
//

import Foundation

struct MediaResponse: Codable{
    var resultCount: Int
    var results: [Media]
}

struct Media: Codable{
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

struct MediaData: Codable{
    var mediaType: String!
    var mediaData: [Media]
}
