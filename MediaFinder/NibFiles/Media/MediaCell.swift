//
//  MediaCell.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 12/08/2022.
//

import UIKit
import Kingfisher

class MediaCell: UITableViewCell {
    
    @IBOutlet weak var lblMediaName: UILabel!
    @IBOutlet weak var lblArtistName: UILabel!
    @IBOutlet weak var imgMedia: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgMedia.isUserInteractionEnabled = true
        imgMedia.translatesAutoresizingMaskIntoConstraints = false
//        imgMedia.heightAnchor.constraint(equalToConstant: 75).isActive = true
//        imgMedia.widthAnchor.constraint(equalToConstant: 75).isActive = true
//        imgMedia.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        imgMedia.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func cellConfig(_ item: Media){
        lblMediaName.text = item.longDescription
        lblArtistName.text = item.artistName
        
        imgMedia.kf.indicatorType = .activity
        if let url = URL(string: item.artworkUrl){
            imgMedia.kf.setImage(with: url)
            
        }
    }
}
