import UIKit
import XCPlayground

class TableViewCell: UITableViewCell {
    let textView: UITextView

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.scrollEnabled = false

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(textView)
        textView.leadingAnchor.constraintEqualToAnchor(leadingAnchor, constant: 8).active = true
        textView.trailingAnchor.constraintEqualToAnchor(trailingAnchor, constant: -8).active = true
        textView.topAnchor.constraintEqualToAnchor(topAnchor, constant: 8).active = true
        textView.bottomAnchor.constraintEqualToAnchor(bottomAnchor, constant: -8).active = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class TableViewController: UITableViewController, UITextViewDelegate {
    let cellIdentifier = "Cell"

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
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TableViewCell
        cell.textView.delegate = self

        return cell
    }

    // MARK: UITextViewDelegate

    func textViewDidChange(textView: UITextView) {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}

let tableViewController = TableViewController(style: .Grouped)
XCPlaygroundPage.currentPage.liveView = tableViewController
