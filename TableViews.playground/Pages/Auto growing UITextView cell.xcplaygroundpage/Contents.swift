import UIKit
import PlaygroundSupport

class TableViewCell: UITableViewCell {
    let textView: UITextView

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(textView)
        textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        textView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        textView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class TableViewController: UITableViewController, UITextViewDelegate {
    let cellIdentifier = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(TableViewCell.self, forCellReuseIdentifier: cellIdentifier)

        // Self sizing cells
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0

        tableView.tableFooterView = UIView()
    }

    // MARK: UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCell
        cell.textView.delegate = self

        return cell
    }

    // MARK: UITextViewDelegate

    func textViewDidChange(_ textView: UITextView) {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}

let tableViewController = TableViewController(style: .grouped)
PlaygroundPage.current.liveView = tableViewController
