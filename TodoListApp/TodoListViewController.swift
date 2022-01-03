//
//  TodoListViewController.swift
//  TodoListApp
//
//  Created by Najd Alsughaiyer on 03/01/2022.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController, SingleItemViewControllerDelegate {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let saveContext = (UIApplication.shared.delegate as! AppDelegate).saveContext
    var items = [Item]()
    
    func addItem(title: String, detials: String, date: String, isDone: Bool) {
        let item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: managedObjectContext) as! Item
        item.title = title
        item.details = detials
        item.due = date
        item.isDone = isDone
        items.append(item)
        saveContext()
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveAllItems()
    }
    
    func retrieveAllItems() {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        do {
            items = try managedObjectContext.fetch(request)
        } catch {
            print(error)
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemViewCell
        cell.itemTitle.text = items[indexPath.row].title
        cell.itemDetails.text = items[indexPath.row].details
        cell.itemDate.text = items[indexPath.row].due
        if items[indexPath.row].isDone {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
                items[indexPath.row].isDone = false
            }
            else {
                cell.accessoryType = .checkmark
                items[indexPath.row].isDone = true
            }
            saveContext()
            tableView.reloadData()
            }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        managedObjectContext.delete(item)
        saveContext()
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navController = segue.destination as! UINavigationController
        let singleItemViewController = navController.topViewController as! SingleItemViewController
        singleItemViewController.delegate = self
    }
}
