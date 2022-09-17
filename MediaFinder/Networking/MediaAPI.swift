//
//  ItunesAPI.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 12/08/2022.
//

import Alamofire

class MediaAPI: NSObject {
    static func loadMediaAPI(term: String, media: String, completion: @escaping (_ error: Error?, _ response: [Media]?) -> Void){
        
        let parameters: [String: Any] = [
            Config.ParametersKeys.term: term,
            Config.ParametersKeys.media: media
        ]
        
        AF.request(Config.URLs.base, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).response {
            response in
            
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
