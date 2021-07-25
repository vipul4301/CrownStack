//
//  SongsListVC.swift
//  CrownStack
//
//  Created by Vipul Kumar on 24/07/21.
//

import UIKit

class SongsListVC: UIViewController, Storyboarded{
    @IBOutlet weak var tableView:UITableView!

    private let cellIdentifire = "SongsTableCell"
    private let viewModel = SongsListViewModel()
    private let refreshControl = UIRefreshControl()
    weak var coordinator: MainCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView.init(frame: .zero)

        let tableCellNib = UINib(nibName: cellIdentifire, bundle: nil)
        self.tableView.register(tableCellNib, forCellReuseIdentifier: cellIdentifire)
        
        self.tableView.refreshControl = refreshControl
        // Configure Refresh Control
        refreshControl.addTarget(self, action: #selector(refreshWeatherData(_:)), for: .valueChanged)
        
        self.getSongsData()
    }
    
    private func getSongsData() {
        viewModel.getSongsList { result in
            self.refreshControl.endRefreshing()
            switch result {
            case .success(_):
                self.tableView.reloadData()
            case .failure:
                print("FAILED")
                //Show Error
                self.showAlert(withMessage: "Network Error")
            }
        }
    }
    
    /// Pull to refersh on value changed handler
    @objc private func refreshWeatherData(_ sender: Any) {
        // Fetch Weather Data
        getSongsData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SongsListVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.songsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifire) as! SongsTableCell
        let model = self.viewModel.songsList[indexPath.row]
        cell.setData(data: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Show Details Screen
        let model = self.viewModel.songsList[indexPath.row]
        coordinator?.songsDetails(data: model)
        
    }
    
}
