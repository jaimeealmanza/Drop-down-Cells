// TableViewController.swift of Drop-down Cells created for Top Code on 24/05/18.
//
// By JaimeAlmanza. Proud member of Swift Team Six.
//
// Copyright © 2018 Top Code. All rights reserved.


import UIKit

class TableViewController: UITableViewController {
    
    
    // MARK: - Outlets
    
    
    
    // MARK: - Properties
    
    struct CellData {
        var opened = Bool()
        var title = String()
        var sectionData = [String]()
    }
    
    var data = [CellData]()

    
    // MARK: - Lifecycle Functions & Initial setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = [CellData(opened: false, title: "Section 1", sectionData: ["Drop-down cell 1", "Drop-down cell 2", "Drop-down cell 3"]),
                CellData(opened: false, title: "Section 2", sectionData: ["Drop-down cell 1", "Drop-down cell 2", "Drop-down cell 3"]),
                CellData(opened: false, title: "Section 3", sectionData: ["Drop-down cell 1", "Drop-down cell 2", "Drop-down cell 3"])]
    }
    
    
    // MARK: - TableView
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if data[section].opened == true {
            return data[section].sectionData.count
        } else {
            return 1 // This is the section cell containing the others
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
            cell.textLabel?.text = data[indexPath.section].title
            return cell
        } else {
            // Use a custom class cell with its unique identifier if needed
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
            cell.textLabel?.text = data[indexPath.section].sectionData[indexPath.row]
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if data[indexPath.section].opened == true {
            data[indexPath.section].opened = false
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none) // Use whichever animation you like
        } else {
            data[indexPath.section].opened = true
        }
    }

}
