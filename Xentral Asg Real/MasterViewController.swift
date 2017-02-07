//
//  MasterViewController.swift
//  Xentral Asg Real
//
//  Created by Nazri Hussein on 2/2/17.
//  Copyright © 2017 zhafrishafiq. All rights reserved.
//

import UIKit

protocol BookSelectionDelegate: class {
    func bookSelected(newBook: Book ,index:Int)
}

class MasterViewController: UITableViewController {

    weak var delegate: BookSelectionDelegate?

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        if let path = Bundle.main.path(forResource: "book", ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: .dataReadingMapped)
                
                let jsonResult =  try JSONSerialization.jsonObject(with: jsonData as Data, options: .mutableContainers) as! [String:Any]
                
                
                print(jsonResult)
                let tocArray = jsonResult["toc"] as! [[String:String]]
                
                for book in tocArray {
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.books.append(Book(name: book["title"]!, url: book["url"]!))
                }
                
                
            }
                
            catch {
                print(error)
            }
        
       
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        return appDelegate.books.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let book = appDelegate.books[indexPath.row]
        cell.textLabel?.text = book.name
        return cell
    }
 

  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let selectedBook = appDelegate.books[indexPath.row]
        
        self.delegate?.bookSelected(newBook: selectedBook, index: indexPath.row)
        
        if let detailViewController = self.delegate as? DetailViewController {
            splitViewController?.showDetailViewController(detailViewController.navigationController!, sender: nil)
        }
    }

}
