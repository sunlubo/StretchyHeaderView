//
//  UIScrollView+ScalableCover.swift
//  StretchyHeaderView
//
//  Created by sunlubo on 16/8/1.
//  Copyright © 2016年 sunlubo. All rights reserved.
//

import Foundation
import UIKit
import ObjectiveC

let kContentOffset = "contentOffset"

// MARK: - Scalable Cover
public class ScalableCover: UIImageView {
	var maxHeight: CGFloat!
	var scrollView: UIScrollView! {
		didSet {
			scrollView.addObserver(self, forKeyPath: kContentOffset, options: .New, context: nil)
		}
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.contentMode = .ScaleAspectFill
		self.clipsToBounds = true
	}

	public required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	public override func removeFromSuperview() {
		scrollView.removeObserver(self, forKeyPath: kContentOffset)
		super.removeFromSuperview()
	}

	public override func layoutSubviews() {
		super.layoutSubviews()

		if scrollView.contentOffset.y < 0 {
			let offset = -scrollView.contentOffset.y
			self.frame = CGRectMake(-offset, -offset, scrollView.bounds.size.width + offset * 2, maxHeight + offset)
		} else {
			self.frame = CGRectMake(0, 0, scrollView.bounds.size.width, maxHeight)
		}
	}

	public override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String: AnyObject]?, context: UnsafeMutablePointer<Void>) {
		setNeedsLayout()
	}
}

// MARK: - UIScrollView Extension
public extension UIScrollView {
	private struct AssociatedKeys {
		static var kScalableCover = "scalableCover"
	}

	private var scalableCover: ScalableCover? {
		set {
			objc_setAssociatedObject(self, &AssociatedKeys.kScalableCover, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
		}
		get {
			return objc_getAssociatedObject(self, &AssociatedKeys.kScalableCover) as? ScalableCover
		}
	}

	func addScalableCover(with image: UIImage, maxHeight: CGFloat = 200) {
		let cover = ScalableCover(frame: CGRectMake(0, 0, self.bounds.size.width, maxHeight))
		cover.backgroundColor = UIColor.clearColor()
		cover.image = image
		cover.maxHeight = maxHeight
		cover.scrollView = self

		addSubview(cover)
		sendSubviewToBack(cover)

		self.scalableCover = cover
		self.contentInset = UIEdgeInsetsMake(maxHeight, 0, 0, 0)
	}

	func removeScalableCover() {
		scalableCover?.removeFromSuperview()
		scalableCover = nil
	}
}
