//
//  DetailViewController.swift
//  Xentral Asg Real
//
//  Created by Nazri Hussein on 2/2/17.
//  Copyright © 2017 zhafrishafiq. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
var loaded = false
    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
        loaded = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBOutlet weak var webnew: UIWebView!
    @IBAction func next(_ sender: Any) {
    }
    @IBAction func back(_ sender: Any) {
    }
    
    
    
    func refreshUI() {
        //self.title = book.name
    
        do {
        let url = Bundle.main.path(forResource: book.url, ofType: "")
        let contents = try String(contentsOfFile: url!, encoding: String.Encoding.utf8)
            let baseURL = URL(fileURLWithPath: url!)
        webnew.loadHTMLString(contents, baseURL: baseURL)
        }
        catch {
            print(error)
        }
    }
    
    var book: Book! {
        didSet (newBook) {
            if loaded {
            self.refreshUI()
            }
        }
    }

}
extension DetailViewController: BookSelectionDelegate {
    func bookSelected(newBook: Book ,index:Int) {
        book = newBook
        self.selectedIndex = index
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        print(appDelegate.books)
    }
}
