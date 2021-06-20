//
//  BaseTableViewController.swift
//  SportEasyTest
//
//  Created by Clément Martin on 20/06/2021.
//

import UIKit

class BaseTableViewController: UITableViewController {
    // MARK: - Properties
    let activityController = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
        activityController.hidesWhenStopped = true
    }
    // MARK: - setup
    func setupNavBar(title: String) {
        self.title = title
        self.navigationController?.navigationBar.barTintColor = AppTheme.AppColor.blueSE
    }

    func setupTableView(rowHeight: CGFloat, allowSelection: Bool) {
        self.tableView.rowHeight = rowHeight
        self.tableView.contentInset.top = 20
        self.tableView.separatorStyle = .none
        self.tableView.allowsSelection = allowSelection
        self.tableView.backgroundColor = AppTheme.AppColor.appBackground
    }
    // MARK: - ActivityIndicator Controller
    func showWait() {
        activityController.startAnimating()
    }

    func showDismiss() {
        activityController.stopAnimating()
    }
}
