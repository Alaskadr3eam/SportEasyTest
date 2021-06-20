//
//  ResultTableViewCell.swift
//  SportEasyTest
//
//  Created by Clément Martin on 20/06/2021.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    static let identifier = "ResultTableViewCell"

    // MARK - Propertie Outlet
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var teamLeftLabel: UILabel!
    @IBOutlet weak var resultTeamLeft: UILabel!
    @IBOutlet weak var teamRightLabel: UILabel!
    @IBOutlet weak var resultTeamRight: UILabel!
    @IBOutlet weak var separatorLine: UIView!

    @IBOutlet weak var cardView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()

        self.backgroundColor = AppTheme.AppColor.appBackground

        self.cardView.backgroundColor = .white
        self.cardView.layer.masksToBounds = true
        self.cardView.layer.cornerRadius = 15
        self.cardView.layer.shadowOpacity = 0.2
        self.cardView.layer.shadowColor = UIColor.gray.cgColor
        self.cardView.layer.shadowOffset = CGSize.zero

        self.dateLabel.font = AppTheme.AppFont.dateFontSize
        self.hourLabel.font = AppTheme.AppFont.hourFontSize
        self.dateLabel.textColor = AppTheme.AppColor.greyText
        self.hourLabel.textColor = AppTheme.AppColor.greyText

        self.teamLeftLabel.font = AppTheme.AppFont.nameAndScoreFontSize1
        self.teamLeftLabel.textColor = AppTheme.AppColor.darkText
        self.resultTeamLeft.font = AppTheme.AppFont.nameAndScoreFontSize1
        self.teamRightLabel.font = AppTheme.AppFont.nameAndScoreFontSize1
        self.teamRightLabel.textColor = AppTheme.AppColor.darkText
        self.resultTeamRight.font = AppTheme.AppFont.nameAndScoreFontSize1

        self.separatorLine.backgroundColor = AppTheme.AppColor.appBackground
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
