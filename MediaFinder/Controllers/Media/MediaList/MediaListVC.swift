//
//  MediaListVC.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 12/08/2022.

import AVKit
import PullToRefresh
import ESPullToRefresh

class MediaListVC: UIViewController {
    
    //-------------------Variables------------------------
    var mediaList: [Media] = []
    //TODO: Make type value to be Enum for easy use.
    var segmantedValue: String = "all"
    
    //-------------------Outlet------------------------
    @IBOutlet weak var imgNoData: UIImageView!
    @IBOutlet weak var lblErrorDesc: UILabel!
    @IBOutlet weak var viewReloading: UIView!
    @IBOutlet weak var activityLoadingPage: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var controller: UISegmentedControl!
    
    //-------------------Actions------------------------
    @IBAction func btnReloadingTapped(_ sender: UIButton) {
        loadingData()
        getAPI()
    }
    
    @IBAction func btnGoProfile(_ sender: UIButton) {
        self.goToProfile()
    }
    
    @IBAction func segmantedController(_ sender: UISegmentedControl) {
        let segmantedIndex = sender.selectedSegmentIndex
        self.segmantedValue = sender.titleForSegment(at: segmantedIndex)?.lowercased() ?? "N/A"
        switch segmantedIndex {
        case 1:
            segmantedValue = "tvShow"
        case 2:
            segmantedValue = "music"
        case 3:
            segmantedValue = "movie"
        default:
            segmantedValue = "all"
        }
        getAPI()
    }
}

//MARK:- LifeCycle Of Screen
extension MediaListVC{
    override func viewDidLoad(){
        super.viewDidLoad()
        self.setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.navigationItem.hidesBackButton = false
        if let data = SQlManager.shared().getMediaData(email: UserDefaultsManager.shared().email) {
            self.mediaList = data.mediaData
            setupSegment(mediaType: data.mediaType ?? "all")
            self.tableView.reloadData()
        }
        print("data will apppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationItem.hidesBackButton = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        let media = MediaData(mediaType: segmantedValue, mediaData: mediaList)
        guard let data = encodeMediaToData(media: media) else {
            print("no data entered.")
            return
        }
        SQlManager.shared().updateMedia(email: UserDefaultsManager.shared().email, userMedia: data)
        print("data updated successfully")
        
    }
}

//MARK:- Private Methods
extension MediaListVC{
    private func setupUI(){
        UserDefaultsManager.shared().isLogedIn = true
        self.loadingData()
        self.pullTorefresh()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.searchBar.delegate = self
        self.activityLoadingPage.startAnimating()
        self.tableView.register(UINib.init(nibName: "MediaCell", bundle: nil), forCellReuseIdentifier: "MediaCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
    }
    private func goToProfile(){
        let profileVC = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
    private func loadingData(){
        self.activityLoadingPage.startAnimating()
        self.tableView.alpha = 1
        self.viewReloading.alpha = 0
    }
    private func hideError(){
        self.tableView.alpha = 1
        self.viewReloading.alpha = 0
        self.activityLoadingPage.alpha = 0
        self.activityLoadingPage.isHidden = true
    }
    private func showError(){
        self.tableView.alpha = 0
        self.viewReloading.alpha = 1
        self.imgNoData.alpha = 0
        self.activityLoadingPage.alpha = 0
        self.activityLoadingPage.isHidden = true
    }
    private func activityLoading(){
        activityLoadingPage.isHidden = false
        activityLoadingPage.alpha = 1
        activityLoadingPage.startAnimating()
    }
    private func pullTorefresh(){
        //if refresh from Top
        self.tableView.es.addPullToRefresh { [weak self] in
            guard let self = self else{return}
            self.getAPI()
            print("top")
        }
        //if refresh from Bottom
        self.tableView.es.addInfiniteScrolling { [weak self] in
            guard let self = self else { return }
            self.getAPI()
        }
    }
    private func setupSegment(mediaType: String){
        switch mediaType {
        case "tvShow":
            controller.selectedSegmentIndex = 1
        case "music":
            controller.selectedSegmentIndex = 2
        case "movie":
            controller.selectedSegmentIndex = 3
        default:
            controller.selectedSegmentIndex = 0
        }
    }
    private func encodeMediaToData(media: MediaData) -> Data? {
        do {
            let encoder = JSONEncoder()
            let mediaData = try encoder.encode(media)
            return mediaData
        } catch {
            print("Unable to Encode mediaData (\(error))")
        }
        return nil
    }
}

//MARK:- API Calling
extension MediaListVC{
    private func getAPI(){
        activityLoading()
        MediaAPI.loadMediaAPI(term: searchBar.text!, media: segmantedValue) { error, response in
            if error != nil {
                print(error!)
                self.showError()
                self.lblErrorDesc.text = "\(error!)"
                DispatchQueue.main.async {
                    self.showAlert(message: "\(error!)")
                }
            } else if let data = response {
                self.tableView.es.stopPullToRefresh()
                self.tableView.es.stopLoadingMore()
                self.hideError()
                if !(data.isEmpty){
                    self.imgNoData.alpha = 0
                    self.mediaList = data
                    self.tableView.reloadData()
                } else {
                    self.showError()
                    self.lblErrorDesc.text = "Can't Loading Data(Media)"
                }
            }
        }
    }
}

//MARK:- UISearchBarDelegate
extension MediaListVC: UISearchBarDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        self.mediaList.removeAll()
        self.imgNoData.alpha = 1
        self.imgNoData.isHidden = false
        self.tableView.reloadData()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if (searchBar.text?.count ?? 0) >= 3 {
            getAPI()
        }
    }
}
