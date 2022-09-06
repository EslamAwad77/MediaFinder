//
//  MediaCell.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 12/08/2022.
//

import UIKit
import Kingfisher

@IBDesignable
class MediaCell: UITableViewCell {
    
    // TODO: IBOutlet
    @IBOutlet weak var lblMediaName: UILabel!
    @IBOutlet weak var lblArtistName: UILabel!
    @IBOutlet weak var imgMedia: UIImageView!
    
    // TODO: IBAction
    @IBAction func btnShakeImage(_ sender: UIButton) {
        ShakeImage()
    }
    
    //TODO: LifeCycle of Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func cellConfig(_ item: Media){
        lblMediaName.text = item.longDescription
        lblArtistName.text = item.trackName
        
        imgMedia.kf.indicatorType = .activity
        if let url = URL(string: item.artworkUrl){
            imgMedia.kf.setImage(with: url)
        }
    }
    
    func ShakeImage(){
        let imageAnimation = CABasicAnimation(keyPath: "position")
        imageAnimation.duration = 0.06
//        imageAnimation.repeatCount = 3
        imageAnimation.autoreverses = true
        imageAnimation.fromValue = NSValue(cgPoint: CGPoint(x: imgMedia.center.x - 10, y: imgMedia.center.y))
        imageAnimation.toValue = NSValue(cgPoint: CGPoint(x: imgMedia.center.x + 10, y: imgMedia.center.y))
        imgMedia.layer.add(imageAnimation, forKey: "position")
    }
}
