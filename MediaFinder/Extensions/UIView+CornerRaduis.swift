//
//  File.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 24/06/2022.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRaduis: CGFloat {
        get{
            return self.cornerRaduis
        } set{
            self.layer.cornerRadius = newValue
        }
    }
}
