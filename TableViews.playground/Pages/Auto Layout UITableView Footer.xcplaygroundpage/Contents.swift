import UIKit
import XCPlayground

class TableViewController: UITableViewController {
    let cellIdentifier = "Cell"

    let data = [
        "Line 1",
        "Line 1\nLine 2",
        "Line 1\nLine 2\nLine 3"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)

        // Self sizing cells
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0

        // Footer view with Auto Layout
        let footerView = UIView()
        let footerViewLabel = UILabel()
        footerViewLabel.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(footerViewLabel)
        footerViewLabel.leadingAnchor.constraintEqualToAnchor(footerView.leadingAnchor, constant: 8).active = true
        footerViewLabel.trailingAnchor.constraintEqualToAnchor(footerView.trailingAnchor, constant: -8).active = true
        footerViewLabel.topAnchor.constraintEqualToAnchor(footerView.topAnchor, constant: 8).active = true
        footerViewLabel.bottomAnchor.constraintEqualToAnchor(footerView.bottomAnchor, constant: -8).active = true
        footerViewLabel.numberOfLines = 0
        footerViewLabel.text = "Footer\nThis is a Footer"
        tableView.tableFooterView = footerView
        footerView.setNeedsLayout()
        footerView.layoutIfNeeded()
        let footerViewHeight = footerView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
        var footerViewFrame = footerView.frame
        footerViewFrame.size.height = footerViewHeight
        footerView.frame = footerViewFrame
        tableView.tableFooterView = footerView
    }

    // MARK: UITableViewDataSource

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.numberOfLines = 0

        return cell
    }
}

let tableViewController = TableViewController(style: .Grouped)
XCPlaygroundPage.currentPage.liveView = tableViewController
