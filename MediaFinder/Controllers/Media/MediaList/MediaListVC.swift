//
//  MediaListVC.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 12/08/2022.
//

import AVKit
import PullToRefresh
import ESPullToRefresh

class MediaListVC: UIViewController {
    
    //TODO: Data
    var mediaList = [Media]()
    var segmantedValue: String = "all"
    
    //TODO: IBOutlet
    @IBOutlet weak var imgNoData: UIImageView!
    @IBOutlet weak var lblErrorDesc: UILabel!
    @IBOutlet weak var viewReloading: UIView!
    @IBOutlet weak var activityLoadingPage: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var controller: UISegmentedControl!
    
    //TODO: IBAction
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
//TODO: LifeCycle Of Screen
extension MediaListVC{
    override func viewDidLoad(){
        super.viewDidLoad()
        self.setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.navigationItem.hidesBackButton = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationItem.hidesBackButton = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

extension MediaListVC{
    func setupUI(){
        UserDefaultsManager.shared.isLogedIn = true
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
    
    func goToProfile(){
        let profileVC = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
}

extension MediaListVC{
    func loadingData(){
        self.tableView.alpha = 0
        self.viewReloading.alpha = 0
    }
}

extension MediaListVC{
    func hideError(){
        self.tableView.alpha = 1
        self.viewReloading.alpha = 0
        self.activityLoadingPage.alpha = 0
        self.activityLoadingPage.isHidden = true
    }
}
extension MediaListVC{
    func showError(){
        self.tableView.alpha = 0
        self.viewReloading.alpha = 1
        self.activityLoadingPage.alpha = 0
        self.activityLoadingPage.isHidden = true
    }
}

extension MediaListVC{
    func getAPI(){
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





extension MediaListVC: UISearchBarDelegate{

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        self.mediaList.removeAll()
        self.imgNoData.alpha = 1
        self.tableView.reloadData()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if (searchBar.text?.count ?? 0) >= 3 {
            getAPI()
        }
    }
}

extension MediaListVC {
    func pullTorefresh(){
        //TODO: if refresh from Top
        self.tableView.es.addPullToRefresh { [weak self] in
            guard let self = self else{return}
            self.getAPI()
            print("top")
        }
        //TODO: if refresh from Bottom
        self.tableView.es.addInfiniteScrolling { [weak self] in
            guard let self = self else { return }
            self.getAPI()
        }
    }
}


// TODO: Image Bouncing
//TODO: video


//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
//        searchBar.endEditing(true)
//        self.filteredMediaList = self.mediaList
//    }
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
//        print("\(searchText)")
//        filteredMediaList = []
//        if searchText != "" {
//           // filteredCategoriesSlides.append(contentsOf: categoriesSlides.filter({$0.categoryName.lowercased().contains(searchText.lowercased())}))
//            for i in 0 ..< mediaList.count{
//                let mediaObj = mediaList[i]
//                if (mediaObj.trackName!.lowercased().contains(searchText.lowercased())){
//                    filteredMediaList.append(mediaObj)
//                }
//            }
//            self.tableView.reloadData()
//        } else {
//            self.filteredMediaList = mediaList
//            self.tableView.reloadData()
//        }
//        print("filteredCategoriesSlides: \(filteredMediaList.count)")
//    }
