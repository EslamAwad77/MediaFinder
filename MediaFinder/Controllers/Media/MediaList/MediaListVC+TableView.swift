//
//  MediaListVC+TableView.swift
//  MediaFinder
//  Created by eslam awad elsayed awad on 20/08/2022.

import AVKit

extension MediaListVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mediaList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCell", for: indexPath) as! MediaCell
        let item = mediaList[indexPath.row]
        if self.segmantedValue == "all"{
            if item.longDescription == nil {
                cell.lblMediaName.text = item.trackName ?? "No Track Name"
                cell.lblArtistName.text = item.artistName ?? "No No artist Name"
                cell.imgMedia.kf.indicatorType = .activity
                if let url = URL(string: item.artworkUrl){
                    cell.imgMedia.kf.setImage(with: url)
                }
            } else if item.artistName == nil {
                cell.lblMediaName.text = item.longDescription ?? "No longDescription"
                cell.lblArtistName.text = item.trackName ?? "No Track Name"
                cell.imgMedia.kf.indicatorType = .activity
                if let url = URL(string: item.artworkUrl){
                    cell.imgMedia.kf.setImage(with: url)
                }
            }else if item.trackName == nil{
                cell.lblMediaName.text = item.longDescription ?? "No longDescription"
                cell.lblArtistName.text = item.artistName ?? "No No artist Name"
                cell.imgMedia.kf.indicatorType = .activity
                if let url = URL(string: item.artworkUrl){
                    cell.imgMedia.kf.setImage(with: url)
                }
            }
          
        } else if self.segmantedValue == "tvShow"{
            cell.lblMediaName.text = item.longDescription ?? "No Track Name"
            cell.lblArtistName.text = item.artistName ?? "No artist Name"
            cell.imgMedia.kf.indicatorType = .activity
            if let url = URL(string: item.artworkUrl){
                cell.imgMedia.kf.setImage(with: url)
            }
        } else if self.segmantedValue == "music"{
            cell.lblMediaName.text = item.trackName ?? "No Track Name"
            cell.lblArtistName.text = item.artistName ?? "No No artist Name"
            cell.imgMedia.kf.indicatorType = .activity
            if let url = URL(string: item.artworkUrl){
                cell.imgMedia.kf.setImage(with: url)
            }
        } else if self.segmantedValue == "movie"{
            cell.lblMediaName.text = item.longDescription ?? "No longDescription"
            cell.lblArtistName.text = item.trackName ?? "No Track Name"
            cell.imgMedia.kf.indicatorType = .activity
            if let url = URL(string: item.artworkUrl){
                cell.imgMedia.kf.setImage(with: url)
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let myCell = cell as? MediaCell
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
        myCell?.imgMedia.layer.transform = rotationTransform
        UIView.animate(withDuration: 0.7){
            myCell?.imgMedia.layer.transform = CATransform3DIdentity
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let url = mediaList[indexPath.row].previewUrl {
            privewUrlPlayer(url)
        }
    }
    
    private func privewUrlPlayer(_ sringUrl: String){
        guard let url = URL(string: sringUrl) else {return}
        let player = AVPlayer(url: url)
        let vc = AVPlayerViewController()
        vc.player = player
        self.present(vc, animated: true) {
            vc.player?.play()
        }
    }
}
