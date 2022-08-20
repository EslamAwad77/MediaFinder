//
//  RequestParameter.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 01/08/2022.
//

import Foundation
import Alamofire
import SwiftyJSON

struct RequestParameter{
    var url: String?
    var method: HTTPMethod?
    var parameters: [String: Any]? = nil
    var headers: HTTPHeaders? = nil
    var completion: (_ error: String?, _ response: JSON?) -> Void
}
