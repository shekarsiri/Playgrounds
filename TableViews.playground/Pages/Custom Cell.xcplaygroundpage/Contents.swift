import UIKit
import XCPlayground

class TableViewCell: UITableViewCell {
    let titleLabel: UILabel

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)

        let url = NSURL(string: "https://devimages.apple.com.edgekey.net/assets/elements/icons/96x96/swift.png")
        let data = NSData(contentsOfURL: url!)
        let image = UIImage(data: data!)
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .ScaleAspectFit

        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.leadingAnchor.constraintEqualToAnchor(leadingAnchor, constant: 8).active = true
        stackView.trailingAnchor.constraintEqualToAnchor(trailingAnchor, constant: -8).active = true
        stackView.topAnchor.constraintEqualToAnchor(topAnchor, constant: 8).active = true
        stackView.bottomAnchor.constraintEqualToAnchor(bottomAnchor, constant: -8).active = true
        stackView.axis = .Horizontal
        stackView.spacing = 8
        stackView.distribution = .Fill
        stackView.alignment = .Center
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class TableViewController: UITableViewController {
    let cellIdentifier = "Cell"

    let data = [
        "Line 1",
        "Line 1\nLine 2",
        "Line 1\nLine 2\nLine 3"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerClass(TableViewCell.self, forCellReuseIdentifier: cellIdentifier)

        // Self sizing cells
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0

        tableView.tableFooterView = UIView()
    }

    // MARK: UITableViewDataSource

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TableViewCell
        cell.titleLabel.text = data[indexPath.row]

        return cell
    }
}

let tableViewController = TableViewController(style: .Plain)
XCPlaygroundPage.currentPage.liveView = tableViewController
