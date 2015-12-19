import XCPlayground
import UIKit

let centerViews = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
centerViews.backgroundColor = UIColor.whiteColor()

let label1 = UILabel()
label1.translatesAutoresizingMaskIntoConstraints = false
label1.text = "Label 1"
label1.backgroundColor = UIColor.yellowColor()
centerViews.addSubview(label1)

let layoutGuide1 = UILayoutGuide()
centerViews.addLayoutGuide(layoutGuide1);

let label2 = UILabel()
label2.translatesAutoresizingMaskIntoConstraints = false
label2.text = "Label 2"
label2.backgroundColor = UIColor.yellowColor()
centerViews.addSubview(label2)

let layoutGuide2 = UILayoutGuide()
centerViews.addLayoutGuide(layoutGuide2);

let label3 = UILabel()
label3.translatesAutoresizingMaskIntoConstraints = false
label3.text = "Label 3"
label3.backgroundColor = UIColor.yellowColor()
centerViews.addSubview(label3)

let centerViewsLayoutMargins = centerViews.layoutMarginsGuide
label1.leadingAnchor.constraintEqualToAnchor(centerViewsLayoutMargins.leadingAnchor).active = true
label1.topAnchor.constraintEqualToAnchor(centerViewsLayoutMargins.topAnchor).active = true
label1.trailingAnchor.constraintEqualToAnchor(layoutGuide1.leadingAnchor).active = true

label2.leadingAnchor.constraintEqualToAnchor(layoutGuide1.trailingAnchor).active = true
label2.topAnchor.constraintEqualToAnchor(centerViewsLayoutMargins.topAnchor).active = true
label2.trailingAnchor.constraintEqualToAnchor(layoutGuide2.leadingAnchor).active = true

label3.leadingAnchor.constraintEqualToAnchor(layoutGuide2.trailingAnchor).active = true
label3.trailingAnchor.constraintEqualToAnchor(centerViewsLayoutMargins.trailingAnchor).active = true
label3.topAnchor.constraintEqualToAnchor(centerViewsLayoutMargins.topAnchor).active = true

layoutGuide2.widthAnchor.constraintEqualToAnchor(layoutGuide1.widthAnchor).active = true

XCPlaygroundPage.currentPage.liveView = centerViews