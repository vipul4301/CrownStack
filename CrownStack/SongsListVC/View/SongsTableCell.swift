//
//  SongsTableCell.swift
//  CrownStack
//
//  Created by Vipul Kumar on 24/07/21.
//

import UIKit

class SongsTableCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblCollectionName: UILabel!
    @IBOutlet weak var lblArtistName: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imgView.layer.cornerRadius = 10.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data: ResultsModel) {
        self.imgView.loadImageFromURL(url: data.artworkUrl100 ?? "")
        self.lblCollectionName.text = data.collectionName
        self.lblArtistName.text = data.artistName
        if let duration = data.trackTimeMillis {
            self.lblDuration.isHidden = false
            self.lblDuration.text = "\(duration/1000) sec"
        }
        else
        {
            self.lblDuration.isHidden = true
        }
    }

}
