import UIKit
import PlaygroundSupport

class TableViewController: UITableViewController {
    let cellIdentifier = "Cell"

    let data = [
        "Line 1",
        "Line 1\nLine 2",
        "Line 1\nLine 2\nLine 3"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)

        // Self sizing cells
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0

        // Footer view with Auto Layout
        let footerView = UIView()
        let footerViewLabel = UILabel()
        footerViewLabel.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(footerViewLabel)
        footerViewLabel.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 8).isActive = true
        footerViewLabel.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -8).isActive = true
        footerViewLabel.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 8).isActive = true
        footerViewLabel.bottomAnchor.constraint(equalTo: footerView.bottomAnchor, constant: -8).isActive = true
        footerViewLabel.numberOfLines = 0
        footerViewLabel.text = "Footer\nThis is a Footer"
        tableView.tableFooterView = footerView
        footerView.setNeedsLayout()
        footerView.layoutIfNeeded()
        let footerViewHeight = footerView.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height
        var footerViewFrame = footerView.frame
        footerViewFrame.size.height = footerViewHeight
        footerView.frame = footerViewFrame
        tableView.tableFooterView = footerView
    }

    // MARK: UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.numberOfLines = 0

        return cell
    }
}

let tableViewController = TableViewController(style: .grouped)
PlaygroundPage.current.liveView = tableViewController
