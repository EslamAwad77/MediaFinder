//
//  RegisterVC+ImagePicker.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 25/07/2022.
//

import UIKit

extension RegisterVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imgViewUser.contentMode = .scaleAspectFit
            imgViewUser.image = pickedImage
        }
        dismiss(animated: true,completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true,completion: nil)
    }
}
