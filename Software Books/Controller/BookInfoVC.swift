//
//  BookInfoVC.swift
//  Software Books
//
//  Created by Hivzi on 24.1.22.
//

import UIKit

class BookInfoVC: UIViewController {
    
    var title1: String?
    var descript: String?
    var imageVariable: UIImage?
    var author1: String?
    var author2: String?
    var pageNumber: Int?
    var publisherName: String?
    var publishedData: String?
    
    
    
    
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet  weak var bookTitle: UILabel!
    @IBOutlet weak var descriptonLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    @IBOutlet weak var pageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var publisherlabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookTitle.text = title1
        descriptonLabel.text = descript
        bookImage.image = imageVariable
        authorsLabel.text = "by: \(author1 ?? "NA")  \(author2 ?? "")"
        pageLabel.text = "page: \(pageNumber ?? 0)"
        dateLabel.text =  "Published: \(publishedData ?? "")"
        publisherlabel.text = " Publisher: \(publisherName ?? "")"
        
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
