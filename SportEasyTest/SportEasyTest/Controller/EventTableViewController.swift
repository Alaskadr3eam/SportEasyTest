//
//  EventTableViewController.swift
//  SportEasyTest
//
//  Created by Clément Martin on 20/06/2021.
//

import UIKit

class EventTableViewController: BaseTableViewController {
    // MARK: - Propertie
    let event = EventModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavBar(title: NSLocalizedString("calendar", comment: ""))
        self.setupTableView(rowHeight: 140, allowSelection: false)

        self.tableView.register(UINib(nibName: ResultTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ResultTableViewCell.identifier)

        self.getMatchResult()
    }
    // MARK: - Request
    private func getMatchResult() {
        self.showWait()
        self.event.getMatchResult { bool, alertMessage in
            guard bool == true else {
                self.showDismiss()
                self.alertUser(title: NSLocalizedString(alertMessage!.title, comment: ""), message: NSLocalizedString(alertMessage!.body, comment: ""), completionOnAgree: self.getMatchResult)
                return
            }
            self.showDismiss()
            self.tableView.reloadData()
        }
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.event.event.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ResultTableViewCell.identifier, for: indexPath) as? ResultTableViewCell else {
            return UITableViewCell()
        }
        cell.model = self.event.event[indexPath.row]
        return cell
    }
}
