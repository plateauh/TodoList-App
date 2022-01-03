//
//  TodoListViewController.swift
//  TodoListApp
//
//  Created by Najd Alsughaiyer on 03/01/2022.
//

import UIKit

class TodoListViewController: UITableViewController, SingleItemViewControllerDelegate {
    
    var items = ["Najd", "Alseghair"]
    
    func addItem(title: String, detials: String, date: String, isDone: Bool) {
        items.append(title)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemViewCell
        cell.itemTitle.text = items[indexPath.row]
        cell.itemDetails.text = items[indexPath.row]
        cell.itemDate.text = "01/03/2022"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
            }
            else {
                cell.accessoryType = .checkmark
            }
            }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navController = segue.destination as! UINavigationController
        let singleItemViewController = navController.topViewController as! SingleItemViewController
        singleItemViewController.delegate = self
    }
}
