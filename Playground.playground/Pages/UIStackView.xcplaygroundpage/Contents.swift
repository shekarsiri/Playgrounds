import UIKit
import PlaygroundSupport

let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 100))
view.backgroundColor = UIColor.white
let stackView = UIStackView()
stackView.translatesAutoresizingMaskIntoConstraints = false
view.addSubview(stackView)

let url = NSURL(string: "https://devimages.apple.com.edgekey.net/assets/elements/icons/96x96/swift.png")
let data = NSData(contentsOf: url as! URL)
let image = UIImage(data: data! as Data)
let imageView = UIImageView(image: image)
imageView.translatesAutoresizingMaskIntoConstraints = false
imageView.contentMode = .scaleAspectFit
stackView.addArrangedSubview(imageView)

let label = UILabel()
label.translatesAutoresizingMaskIntoConstraints = false
label.text = "Hello, world"
label.backgroundColor = UIColor.yellow
label.setContentHuggingPriority(249, for: .horizontal)
stackView.addArrangedSubview(label)

let button = UIButton(type: .system)
button.translatesAutoresizingMaskIntoConstraints = false
button.setTitle("Click me", for: .normal)
stackView.addArrangedSubview(button)

stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
stackView.spacing = 8

PlaygroundPage.current.liveView = view
