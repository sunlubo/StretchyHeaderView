//
//  UINavigationBar+Alpha.swift
//  StretchyHeaderView
//
//  Created by sunlubo on 16/8/1.
//  Copyright © 2016年 sunlubo. All rights reserved.
//

import Foundation
import UIKit

private func image(with rect: CGRect, color: UIColor) -> UIImage {
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    CGContextSetFillColorWithColor(context, color.CGColor)
    CGContextFillRect(context, rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
}

public extension UINavigationBar {
    private struct AssociatedKeys {
        static var kScrollView = "scrollView"
        static var kBarColor = "barColor"
    }

    var barColor: UIColor? {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.kBarColor, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.kBarColor) as? UIColor
        }
    }
    private var scrollView: UIScrollView? {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.kScrollView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.kScrollView) as? UIScrollView
        }
    }
    private var distance: CGFloat {
        return scrollView!.contentInset.top
    }

    private func updateAlpha(alpha: CGFloat = 0.0) {
        let color = (barColor ?? tintColor).colorWithAlphaComponent(alpha)
        setBackgroundImage(image(with: CGRectMake(0, 0, 1, 1), color: color.colorWithAlphaComponent(alpha)), forBarMetrics: .Default)
    }

    func attachToScrollView(scrollView: UIScrollView) {
        self.scrollView = scrollView
        self.shadowImage = UIImage()
        self.tintColor = UIColor.whiteColor()
        self.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        scrollView.addObserver(self, forKeyPath: kContentOffset, options: .New, context: nil)
    }

    func reset() {
        self.scrollView?.removeObserver(self, forKeyPath: kContentOffset)
        self.scrollView = nil
        self.shadowImage = nil
        self.tintColor = nil
        self.titleTextAttributes = nil
        self.setBackgroundImage(nil, forBarMetrics: .Default)
    }

    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String: AnyObject]?, context: UnsafeMutablePointer<Void>) {
        guard let scrollView = scrollView else { return }

        let offsetY = scrollView.contentOffset.y
        if offsetY > -distance {
            let alpha = min(1, 1 - ((-distance + 120 - offsetY) / 64))
            updateAlpha(alpha)
        } else {
            updateAlpha(0)
        }
    }
}
