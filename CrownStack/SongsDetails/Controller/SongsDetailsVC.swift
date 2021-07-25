//
//  SongsDetailsVC.swift
//  CrownStack
//
//  Created by Vipul Kumar on 24/07/21.
//

import UIKit

class SongsDetailsVC: UIViewController, Storyboarded {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    weak var coordinator: MainCoordinator?
    var songsDetails: ResultsModel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let model = self.songsDetails {
            self.lblTitle.text = model.collectionName
            self.lblDesc.text  = model.description
            self.imgView.loadImageFromURL(url: model.artworkUrl100 ?? "")
        }
        
    }
    
    
    // MARK: - Button Action
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
