//
//  TodoListViewController.swift
//  TodoListApp
//
//  Created by Najd Alsughaiyer on 03/01/2022.
//

import UIKit

class TodoListViewController: UITableViewController, SingleItemViewControllerDelegate {
    
    var items = ["Najd", "Alseghair"]
    var details = ["Lorem Ipsum is simply dummy text of the printing and typesetting industry. ", "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."]
    var dates = ["01/03/2022", "01/04/2022"]
    
    func addItem(title: String, detials: String, date: String, isDone: Bool) {
        items.append(title)
        details.append(detials)
        dates.append(date)
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
        cell.itemDetails.text = details[indexPath.row]
        cell.itemDate.text = dates[indexPath.row]
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        details.remove(at: indexPath.row)
        dates.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navController = segue.destination as! UINavigationController
        let singleItemViewController = navController.topViewController as! SingleItemViewController
        singleItemViewController.delegate = self
    }
}
