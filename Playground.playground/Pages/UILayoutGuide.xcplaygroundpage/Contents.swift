import PlaygroundSupport
import UIKit

let centerViews = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
centerViews.backgroundColor = UIColor.white

let label1 = UILabel()
label1.translatesAutoresizingMaskIntoConstraints = false
label1.text = "Label 1"
label1.backgroundColor = UIColor.yellow
centerViews.addSubview(label1)

let layoutGuide1 = UILayoutGuide()
centerViews.addLayoutGuide(layoutGuide1);

let label2 = UILabel()
label2.translatesAutoresizingMaskIntoConstraints = false
label2.text = "Label 2"
label2.backgroundColor = UIColor.yellow
centerViews.addSubview(label2)

let layoutGuide2 = UILayoutGuide()
centerViews.addLayoutGuide(layoutGuide2);

let label3 = UILabel()
label3.translatesAutoresizingMaskIntoConstraints = false
label3.text = "Label 3"
label3.backgroundColor = UIColor.yellow
centerViews.addSubview(label3)

let centerViewsLayoutMargins = centerViews.layoutMarginsGuide
label1.leadingAnchor.constraint(equalTo: centerViewsLayoutMargins.leadingAnchor).isActive = true
label1.topAnchor.constraint(equalTo: centerViewsLayoutMargins.topAnchor).isActive = true
label1.trailingAnchor.constraint(equalTo: layoutGuide1.leadingAnchor).isActive = true

label2.leadingAnchor.constraint(equalTo: layoutGuide1.trailingAnchor).isActive = true
label2.topAnchor.constraint(equalTo: centerViewsLayoutMargins.topAnchor).isActive = true
label2.trailingAnchor.constraint(equalTo: layoutGuide2.leadingAnchor).isActive = true

label3.leadingAnchor.constraint(equalTo: layoutGuide2.trailingAnchor).isActive = true
label3.trailingAnchor.constraint(equalTo: centerViewsLayoutMargins.trailingAnchor).isActive = true
label3.topAnchor.constraint(equalTo: centerViewsLayoutMargins.topAnchor).isActive = true

layoutGuide2.widthAnchor.constraint(equalTo: layoutGuide1.widthAnchor).isActive = true

PlaygroundPage.current.liveView = centerViews
