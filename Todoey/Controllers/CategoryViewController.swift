//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Brandon Lehr on 2/15/19.
//  Copyright © 2019 Brandon Lehr. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categoryArray = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        loadCategories()
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            if textField.text! != "" {
                let newCategory = Category(context: self.context)
                newCategory.name  = textField.text!
                
                self.categoryArray.append(newCategory)
                
                self.saveCategories()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (action) in }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create Category"
            textField = alertTextField
        }
        
        alert.addAction(cancelAction)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categoryArray[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let category = categoryArray[indexPath.row]
        
//        print(category.name!)
        
//        tableView.deselectRow(at: indexPath, animated: true)
        
        
        performSegue(withIdentifier: "goToItems", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryArray[indexPath.row]
        }
    }
    
    
    
    func saveCategories() {
        do {
            try context.save()
        } catch {
            print("Error saving \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func  loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
        
        do {
            categoryArray = try context.fetch(request)
        } catch {
            print("Error Loading data \(error)")
        }
        tableView.reloadData()
    }
    
    
    
    
}
