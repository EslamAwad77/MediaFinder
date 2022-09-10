//
//  UserModel.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 27/06/2022.
//
import UIKit

struct UserModel: Codable {
    var name: String?
    var email: String?
    var password: String?
    var phone: String?
    var address: String?
    var userImage: ImageCodable?
}

struct ImageCodable: Codable {
    let imageData: Data?
    init(withImage image: UIImage){
        self.imageData = image.jpegData(compressionQuality: 1.0)
    }
    func getImage() -> UIImage?{
        guard let imageData = self.imageData else {
            return nil
        }
        let image = UIImage(data: imageData)
        return image
    }
}

