//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Gibson Smiley on 2/12/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(sender: ButtonTableViewCell)
}

class ButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var delegate: ButtonTableViewCellDelegate?

    @IBAction func buttonTapped(sender: UIButton) {
        delegate?.buttonCellButtonTapped(self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateButton(isComplete: Bool) {
        if isComplete.boolValue == true {
            button.setImage(UIImage(named: "complete"), forState: .Normal)
        } else if isComplete == false {
            button.setImage(UIImage(named: "incomplete"), forState: .Normal)
        }
    }
    
    func updateWithTask(task: Task) {
        self.titleLabel.text = task.title
    }
}
