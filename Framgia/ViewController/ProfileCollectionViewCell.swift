//
//  ProfileCollectionViewCell.swift
//  Framgia
//
//  Created by  on 12/26/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import UIKit

class ProfileCollectionViewCell: BaseCollectionViewCell {

    @IBOutlet weak var timelineImg: UIImageView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override class func getSize() -> CGSize {
        return CGSize (width: DeviceManager.getWinSize().width, height: 280)
    }


}
