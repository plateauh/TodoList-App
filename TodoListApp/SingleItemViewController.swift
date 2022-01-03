//
//  ViewController.swift
//  TodoListApp
//
//  Created by Najd Alsughaiyer on 03/01/2022.
//

import UIKit

class SingleItemViewController: UIViewController {

    @IBOutlet weak var itemTitleTF: UITextField!
    @IBOutlet weak var itemDetailsTV: UITextView!
    @IBOutlet weak var itemDateDP: UIDatePicker!
    var delegate: SingleItemViewControllerDelegate?
    var indexPath: NSIndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addItemButtonPressed(_ sender: UIButton) {
        delegate?.addItem(title: itemTitleTF.text!, detials: itemDetailsTV.text, date: "\(itemDateDP.date)", isDone: false)
    }
    
}

