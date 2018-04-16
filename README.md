# LRDTableView
LRDTableView is a lightweight custom UITableView to handle easily empty tableViews by showing a label & image and button

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Examples

All you have to do is set you UITableView's class to LRDTableView in the IB identity inspector and connect the outlet

```Swift
@IBOutlet weak var tableView: LRDTableView!
```


```Swift

// add action to the LRDTableView Actionbutton
self.tableView.actionButton.addTarget(self, action: #selector(self.fillTableView), for: UIControlEvents.touchUpInside)

// you should set this to true only if you're sure that the list isn't gonna be empty in first place
self.tableView.shouldListenToFirstReload = true

// distance from top label to LRDTableViews top default is 10
self.tableView.topDistance = 50.0
```

<!--### Configuring the rows-->
<!--```Swift-->
<!--tableRow.configureCell {-->
<!--cell in-->
<!--let label = cell.viewWithTag(1) as! UILabel-->
<!--label.text = "Custom text"-->
<!--}-->
<!--```-->
<!---->
<!--### Selection handler-->
<!--```Swift-->
<!--tableRow.onSelect {-->
<!--row in-->
<!--NSLog("selected row \(row.userObject)")-->
<!--}-->
<!--```-->
<!---->
<!--### Adding, inserting and removing rows-->
<!--```Swift-->
<!--// Adding multiple rows-->
<!--tableSection.addRows(arrayOfRows) // IMPORTANT: Notice that this performs much faster than inserting a bunch of rows one by one in a loop-->
<!--// Insert a row at an index-->
<!--tableSection.insertRow(newRow, atIndex:0)-->
<!--// Remove a row-->
<!--tableSection.removeRow(tableRow)-->
<!--// Remove multiple rows-->
<!--tableSection.removeRows(arrayOfRows) // IMPORTANT: Notice that this performs much faster than removing a bunch of rows one by one in a loop-->
<!--// Removing all rows-->
<!--tableSection.removeAllRows()-->
<!--```-->
<!---->
<!--### Inserting removing sections-->
<!--```Swift-->
<!--// Insert a section at an index-->
<!--LRDTableView.insertSection(newSection, atIndex:0)-->
<!--// Remove section-->
<!--LRDTableView.removeSection(tableSection)-->
<!--// Remove all sections-->
<!--LRDTableView.removeAllSections()-->
<!--```-->
<!---->
<!--### Cell with custom sub class-->
<!--```Swift-->
<!--tableRow.configureCell {-->
<!--cell in-->
<!--let myCustomCell = cell as! MyCustomCell-->
<!--myCustomCell.setTitle("Custom title")-->
<!--}-->
<!--```-->
<!---->
<!--### Custom section header views-->
<!--```Swift-->
<!--let customHeaderView = UIView() // Can be any UIView or subclass instance-->
<!--tableSection.headerView = customHeaderView-->
<!--tableSection.headerHeight = customHeaderView.frame.size.height-->
<!--```-->
<!---->
<!--### Custom row height-->
<!--```Swift-->
<!--tableRow.height = Float(90)-->
<!--```-->
<!---->
<!--### Custom row height with closure-->
<!--```Swift-->
<!--tableRow.configureHeight {-->
<!--return 100-->
<!--}-->
<!--```-->
<!---->
<!--### Row animation for adding, inserting and removing rows-->
<!--```Swift-->
<!--tableSection.rowAnimation = UITableRowAnimation.Right-->
<!--tableSection.addRow(newRow)-->
<!--```-->
<!---->
<!--### Section animation for adding, inserting and removing sections-->
<!--```Swift-->
<!--LRDTableView.sectionAnimation = UITableRowAnimation.Fade-->
<!--LRDTableView.addSection(newSection)-->
<!--```-->

## Installation
LRDTableView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "LRDTableView"
```

## Author
Mahmoud Ashraf, mahmoud28@gmail.com

## License
LRDTableView is available under the MIT license. See the LICENSE file for more info.
