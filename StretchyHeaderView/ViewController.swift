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
		self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(done))
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(add))

		let navigationBar = navigationController!.navigationBar
		navigationBar.barColor = UIColor(colorLiteralRed: 52 / 255, green: 152 / 255, blue: 219 / 255, alpha: 1)

		tableView.addScalableCover(with: UIImage(named: "FullSizeRender.jpg")!)
		tableView.showsVerticalScrollIndicator = false
		tableView.tableFooterView = UIView()
	}

	func add() {
		let detailVC = DetailViewController()
		navigationController!.pushViewController(detailVC, animated: true)
	}

	func done() {
		print(#function)
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		let navigationBar = navigationController!.navigationBar
		navigationBar.attachToScrollView(tableView)
	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		let navigationBar = navigationController!.navigationBar
		navigationBar.reset()
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 20
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		return UITableViewCell()
	}
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
