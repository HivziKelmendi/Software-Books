//
//  BookInfoVC.swift
//  Software Books
//
//  Created by Hivzi on 24.1.22.
//

import UIKit

class BookInfoVC: UIViewController {
    
     var title1: String?

    @IBOutlet  weak var bookTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(title1)
        bookTitle.text = title1
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
