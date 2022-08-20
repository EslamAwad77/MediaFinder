//
//  MediaListVC+TableView.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 20/08/2022.
//

import AVKit

extension MediaListVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mediaList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCell", for: indexPath) as! MediaCell
        let item = mediaList[indexPath.row]
        cell.cellConfig(item)
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
