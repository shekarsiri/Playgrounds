import UIKit
import PlaygroundSupport

let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
view.backgroundColor = UIColor.white

let label = UILabel()
label.translatesAutoresizingMaskIntoConstraints = false
label.text = "Hello, world"
label.backgroundColor = UIColor.yellow
view.addSubview(label)

// Center in superview
label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

// Pin the label to the superview margins
//let viewLayoutMargins = view.layoutMarginsGuide
//label.leadingAnchor.constraint(equalTo: viewLayoutMargins.leadingAnchor).isActive = true
//label.trailingAnchor.constraint(equalTo: viewLayoutMargins.trailingAnchor).isActive = true
//label.topAnchor.constraint(equalTo: viewLayoutMargins.topAnchor).isActive = true
//label.bottomAnchor.constraint(equalTo: viewLayoutMargins.bottomAnchor).isActive = true

PlaygroundPage.current.liveView = view
