// TableViewController.swift of Drop-down Cells created for Top Code on 24/05/18.
//
// By JaimeAlmanza. Proud member of Swift Team Six.
//
// Copyright © 2018 Top Code. All rights reserved.


import UIKit

class TableViewController: UITableViewController {
    
    
    // MARK: - Outlets
    
    
    
    // MARK: - Properties
    
    struct CustomSection {
        var opened = Bool()
        var title = String()
        var cells = [String]()
    }
    
    var mainSections = [CustomSection]()

    
    // MARK: - Lifecycle Functions & Initial setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainSections = [CustomSection(opened: false, title: "Section 1", cells: ["Sec. 1 Drop-down cell 1", "Sec. 1 Drop-down cell 2", "Sec. 1 Drop-down cell 3"]),
                        CustomSection(opened: false, title: "Section 2", cells: ["Sec. 2 Drop-down cell 1", "Sec. 2 Drop-down cell 2", "Sec. 2 Drop-down cell 3"]),
                        CustomSection(opened: false, title: "Section 3", cells: ["Sec. 3 Drop-down cell 1", "Sec. 3 Drop-down cell 2", "Sec. 3 Drop-down cell 3"])]
    }
    
    
    // MARK: - TableView
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return mainSections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mainSections[section].opened == true {
            return mainSections[section].cells.count + 1 // Plus one to account for the first drop-down cell
        } else {
            return 1 // This is the section cell containing the others
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
            cell.textLabel?.text = mainSections[indexPath.section].title
            return cell
        } else {
            // Use a custom class cell with its unique identifier if needed
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
            cell.textLabel?.text = mainSections[indexPath.section].cells[indexPath.row - 1] // Minus one since we have cells in total (including the section cell) but only three elements as sectionData
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if mainSections[indexPath.section].opened == true {
            mainSections[indexPath.section].opened = false
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none) // Use whichever animation you like
        } else {
            mainSections[indexPath.section].opened = true
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none) // Use whichever animation you like
        }
    }

}
