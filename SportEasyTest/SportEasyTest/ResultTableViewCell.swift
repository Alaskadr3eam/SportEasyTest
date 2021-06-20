//
//  ResultTableViewCell.swift
//  SportEasyTest
//
//  Created by Clément Martin on 20/06/2021.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    static let identifier = "ResultTableViewCell"

    // MARK - Properties Outlet
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var teamLeftLabel: UILabel!
    @IBOutlet weak var resultTeamLeft: UILabel!
    @IBOutlet weak var teamRightLabel: UILabel!
    @IBOutlet weak var resultTeamRight: UILabel!
    @IBOutlet weak var separatorLine: UIView!

    @IBOutlet weak var cardView: UIView!
    // MARK: - Properties
    var model: EventElement! {
        didSet {
            self.configureDateLabel(model: model)
            self.configureTeamsLabel(model: model)
            self.configureResultLabel(model: model)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        self.backgroundColor = AppTheme.AppColor.appBackground

        self.cardView.backgroundColor = .white
        self.cardView.layer.masksToBounds = false
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
    }

    override func prepareForReuse() {
        self.dateLabel.text = ""
        self.hourLabel.text = ""
        self.teamLeftLabel.text = ""
        self.resultTeamLeft.text = ""
        self.teamRightLabel.text = ""
        self.resultTeamRight.text = ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    // MARK: - Configure Cell
    private func configureResultLabel(model: EventElement) {
        if model.leftTeam.score == model.rightTeam.score {
            self.resultTeamRight.textColor = AppTheme.AppColor.greyText
            self.resultTeamLeft.textColor = AppTheme.AppColor.greyText
        } else if model.leftTeam.score > model.rightTeam.score {
            self.resultTeamLeft.textColor = AppTheme.AppColor.greenText
            self.resultTeamRight.textColor = AppTheme.AppColor.redText
        } else if model.leftTeam.score < model.rightTeam.score {
            self.resultTeamLeft.textColor = AppTheme.AppColor.redText
            self.resultTeamRight.textColor = AppTheme.AppColor.greenText
        }
        self.resultTeamLeft.text = "\(model.leftTeam.score)"
        self.resultTeamRight.text = "\(model.rightTeam.score)"
    }

    private func configureTeamsLabel(model: EventElement) {
        self.teamLeftLabel.text = model.leftTeam.name
        self.teamRightLabel.text = model.rightTeam.name
    }

    private func configureDateLabel(model: EventElement) {
        self.dateLabel.text = model.date
        self.hourLabel.text = model.time
    }
    
}
