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
    }

    @IBAction func addItemButtonPressed(_ sender: UIButton) {
        // src: https://medium.com/geekculture/new-date-formatter-api-f2e6da01d407
        let dateFormatted = itemDateDP.date.formatted(.dateTime
                                                        .month(.twoDigits)
                                                        .day(.twoDigits)
                                                        .year())
        delegate?.addItem(title: itemTitleTF.text!, detials: itemDetailsTV.text, date: dateFormatted, isDone: false)
    }
    
}

