//
//  Config.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 02/08/2022.
//

import Foundation

struct Config {
    struct StoryBoards{
        static let main = "Main"
    }
    struct ViewControllers{
        static let register = "RegisterVC"
    }
    struct Nibs{
        static let mediaCell = "MediaCell"
    }
    struct UserDefaultsKeys{
        static let isLogedIn = "isLogedIn"
    }
    struct URLs {
        static let base = "https://itunes.apple.com/search?"
    }
    struct ParametersKeys {
        static let term = "term"
        static let media = "media"
    }
}
