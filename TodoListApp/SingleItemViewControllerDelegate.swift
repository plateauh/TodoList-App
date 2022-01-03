//
//  SingleItemViewControllerDelegate.swift
//  TodoListApp
//
//  Created by Najd Alsughaiyer on 03/01/2022.
//

import Foundation

protocol SingleItemViewControllerDelegate: AnyObject {
    func addItem(title: String, detials: String, date: String, isDone: Bool)
}
