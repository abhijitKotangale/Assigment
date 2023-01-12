//
//  ActivityViewCell.swift
//  SuperMindAssignment
//
//  Created by Abhijit Kotangale on 12/01/23.
//

import UIKit

protocol TimerTigeredDelegate:AnyObject {
    func activityTimerClicked(tag:Int)
}

class ActivityViewCell: UITableViewCell {
    
    //Outlet
    @IBOutlet weak var imgActivity: UIImageView!
    @IBOutlet weak var lblActivityTitle: UILabel!
    @IBOutlet weak var lblActivityCategory: UILabel!
    @IBOutlet weak var lblXP: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var btnActivityTime: UIButton!
    
    //Delegates
    weak var delegate:TimerTigeredDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnSetTimerAction(_ sender: Any) {
        self.delegate?.activityTimerClicked(tag: btnActivityTime.tag)
    }
    
    
}
