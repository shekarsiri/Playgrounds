import UIKit
import XCPlayground

let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
view.backgroundColor = UIColor.whiteColor()

let label = UILabel()
label.translatesAutoresizingMaskIntoConstraints = false
label.text = "Hello, world"
label.backgroundColor = UIColor.yellowColor()
view.addSubview(label)

// Center in superview
label.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
label.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true

// Pin the label to the superview margins
//let viewLayoutMargins = view.layoutMarginsGuide
//label.leadingAnchor.constraintEqualToAnchor(viewLayoutMargins.leadingAnchor).active = true
//label.trailingAnchor.constraintEqualToAnchor(viewLayoutMargins.trailingAnchor).active = true
//label.topAnchor.constraintEqualToAnchor(viewLayoutMargins.topAnchor).active = true
//label.bottomAnchor.constraintEqualToAnchor(viewLayoutMargins.bottomAnchor).active = true

XCPlaygroundPage.currentPage.liveView = view
