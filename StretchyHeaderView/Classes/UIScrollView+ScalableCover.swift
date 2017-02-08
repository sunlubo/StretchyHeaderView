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
open class ScalableCover: UIImageView {
    fileprivate var maxHeight: CGFloat!
    fileprivate var scrollView: UIScrollView! {
        didSet {
            scrollView.addObserver(self, forKeyPath: kContentOffset, options: .new, context: nil)
        }
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override func removeFromSuperview() {
        scrollView.removeObserver(self, forKeyPath: kContentOffset)
        super.removeFromSuperview()
    }

    open override func layoutSubviews() {
        super.layoutSubviews()

        if scrollView.contentOffset.y < 0 {
            let offset = -scrollView.contentOffset.y
            self.frame = CGRect(x: -offset, y: -offset, width: scrollView.bounds.size.width + offset * 2, height: maxHeight + offset)
        } else {
            self.frame = CGRect(x: 0, y: 0, width: scrollView.bounds.size.width, height: maxHeight)
        }
    }

    open override func observeValue(forKeyPath _: String?, of _: Any?, change _: [NSKeyValueChangeKey: Any]?, context _: UnsafeMutableRawPointer?) {
        setNeedsLayout()
    }
}

// MARK: - UIScrollView Extension
extension UIScrollView {

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

    public func addScalableCover(with image: UIImage, maxHeight: CGFloat = 200) {
        let cover = ScalableCover(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: maxHeight))
        cover.backgroundColor = UIColor.clear
        cover.image = image
        cover.maxHeight = maxHeight
        cover.scrollView = self

        addSubview(cover)
        sendSubview(toBack: cover)

        self.scalableCover = cover
        self.contentInset = UIEdgeInsetsMake(maxHeight, 0, 0, 0)
    }

    public func removeScalableCover() {
        scalableCover?.removeFromSuperview()
        scalableCover = nil
    }
}
