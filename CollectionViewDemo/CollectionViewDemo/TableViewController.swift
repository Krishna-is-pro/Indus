//
//  TableViewController.swift
//  CollectionViewDemo
//
//  Created by indus on 26/08/24.
//

import UIKit

class TableViewController: UITableViewController {
    
    let lines : [String] = ["`UICollectionView` is a powerful and flexible class used to display a grid or list of items in iOS apps","Each item in a collection view is represented by a cell","Data Source of Collection View","A `UICollectionView` is a powerful and flexible class used to display a grid or list of items in iOS apps. It’s similar to a `UITableView` but offers more customization and allows for layouts with multiple columns or varying sizes of cells."]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
        UIView.animate(withDuration: 0.3) {
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }

    }

    override func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lines.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell

        // Configure the cell...
        tableViewCell.nameLabel.text = lines[indexPath.row]
        return tableViewCell
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
            let text = lines[indexPath.row]
            
            // Set the maximum width for the text considering your cell padding
            let maxWidth = tableView.frame.width - 40 // Adjust this value based on padding
            
            // Define the font used in the label
            let font = UIFont.systemFont(ofSize: 17) // Match this with your label's font
            
            // Calculate the height of the text
            let textHeight = text.boundingRect(
                with: CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude),
                options: .usesLineFragmentOrigin,
                attributes: [NSAttributedString.Key.font: font],
                context: nil
            ).height
            
            // Return the calculated height with some padding
            return textHeight + 20 // Add some extra padding if needed
        }

}
