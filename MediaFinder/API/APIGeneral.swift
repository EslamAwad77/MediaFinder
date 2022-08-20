//
//  APIGeneral.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 01/08/2022.
//

import UIKit
import Alamofire
import SwiftyJSON

class APIGeneral: NSObject {
    
    func fetchingData(request: RequestParameter){
        AF.request(request.url!, method: request.method!, parameters: request.parameters, encoding: URLEncoding.default, headers: request.headers).response { response in
            if (response.response?.statusCode ?? 0 >= 200) && (response.response?.statusCode ?? 0 <= 299) {
                let json = JSON(response.data!)
                request.completion(nil, json)
            } else {
                let json = JSON(response.data!)
                let msg  = json["message"].string
                request.completion(msg, nil)
            }
        }
    }
}
