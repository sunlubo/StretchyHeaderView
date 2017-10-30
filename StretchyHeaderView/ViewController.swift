//
//  ViewController.swift
//  StretchyHeaderView
//
//  Created by sunlubo on 16/8/1.
//  Copyright © 2016年 sunlubo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "StretchyHeaderView"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))

        let navigationBar = navigationController!.navigationBar
        navigationBar.barColor = UIColor(red: 52 / 255, green: 152 / 255, blue: 219 / 255, alpha: 1)

        tableView.addScalableCover(with: UIImage(named: "FullSizeRender.jpg")!)
        tableView.showsVerticalScrollIndicator = false
        tableView.tableFooterView = UIView()
    }

    @objc func add() {
        let detailVC = DetailViewController()
        navigationController!.pushViewController(detailVC, animated: true)
    }

    @objc func done() {
        print(#function)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let navigationBar = navigationController!.navigationBar
        navigationBar.attachToScrollView(tableView)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let navigationBar = navigationController!.navigationBar
        navigationBar.reset()
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 20
    }

    override func tableView(_: UITableView, cellForRowAt _: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
