//
//  ItunesAPI.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 12/08/2022.
//

import Foundation
import Alamofire

class MediaAPI: NSObject {
    static func loadMediaAPI(term: String, media: String, completion: @escaping (_ error: Error?, _ response: [Media]?) -> Void){
        let url = "https://itunes.apple.com/search?"
        let parameters: [String: Any] = [
            "term": term,
            "media": media
        ]
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).response {
            response in
            print(response.data?.description)
            
            guard response.error == nil else {
                print("error \(response.error!)")
                completion(response.error, nil)
                return
            }
            
            guard let data = response.data else{
                print("didn't get any data from API")
                return
            }
            do{
                let jsonDecoder = JSONDecoder()
                let mediaData = try jsonDecoder.decode(MediaResponse.self, from: data)
                let media = mediaData.results
                completion(nil, media)
              
            } catch {
                print(error.localizedDescription)
                completion(error, nil)
            }
        }
    }
}
