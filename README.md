# StretchyHeaderView

![StretchyHeaderView](screenshots/snapshot.gif)

Installation
------------

### CocoaPods
Just add `pod 'StretchyHeaderView'` to your Podfile and go!

In any file you'd like to use StretchyHeaderView in, don't forget to
import the framework with `import StretchyHeaderView`.

Then run `pod install` or `pod update`.

Usage
---

```swift
/// Scalable Cover
tableView.addScalableCover(with: UIImage(named: "FullSizeRender.jpg")!)


/// Change navigation bar's appearance dynamically.
navigationBar.barColor = UIColor(colorLiteralRed: 52 / 255, green: 152 / 255, blue: 219 / 255, alpha: 1)

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
```

License
-------

StretchyHeaderView is released under an Apache license. See LICENSE for more information.
