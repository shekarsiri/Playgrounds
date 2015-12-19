import UIKit
import XCPlayground

let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 100))
view.backgroundColor = UIColor.whiteColor()
let stackView = UIStackView()
stackView.translatesAutoresizingMaskIntoConstraints = false
view.addSubview(stackView)

let url = NSURL(string: "https://devimages.apple.com.edgekey.net/assets/elements/icons/96x96/swift.png")
let data = NSData(contentsOfURL: url!)
let image = UIImage(data: data!)
let imageView = UIImageView(image: image)
imageView.translatesAutoresizingMaskIntoConstraints = false
imageView.contentMode = .ScaleAspectFit
stackView.addArrangedSubview(imageView)

let label = UILabel()
label.translatesAutoresizingMaskIntoConstraints = false
label.text = "Hello, world"
label.backgroundColor = UIColor.yellowColor()
label.setContentHuggingPriority(249, forAxis: .Horizontal)
stackView.addArrangedSubview(label)

let button = UIButton(type: .System)
button.translatesAutoresizingMaskIntoConstraints = false
button.setTitle("Click me", forState: .Normal)
stackView.addArrangedSubview(button)

stackView.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor, constant: 8).active = true
stackView.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor, constant: -8).active = true
stackView.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: 8).active = true
stackView.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor, constant: -8).active = true
stackView.spacing = 8

XCPlaygroundPage.currentPage.liveView = view
