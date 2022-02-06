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
    var pageNumber: Int?
    var publisherName: String?
    var publishedData: String?
    var subtitle: String?
    var author1: String = ""
    var author2: String = ""

    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet  weak var bookTitle: UILabel!
    @IBOutlet weak var descriptonLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    @IBOutlet weak var pageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var publisherlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authorsLabel.text = "by: \(author1)  \(author2)"
        bookTitle.text = title1
        descriptonLabel.text = descript
        bookImage.image = imageVariable
        pageLabel.text = "page: \(pageNumber ?? 0)"
        dateLabel.text =  "Published: \(publishedData ?? "")"
        publisherlabel.text = " Publisher: \(publisherName ?? "")"
    }
    
  
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let imageData =  imageVariable?.pngData()  as? NSData

        let favoriteBook = InfoBook(title1: title1, author1: author1, author2: author2, descript: descript, imageVariable: imageData, pageNumber: pageNumber, publisherName: publisherName, publishedData: publishedData, subtitle: subtitle)
        var persistence = PersistenceManager()
        persistence.addBookToFavorites(favorite: favoriteBook)
    }
}
struct InfoBook {
    var title1: String?
    var author1: String?
    var author2: String?
    var descript: String?
    var imageVariable: NSData?
    var pageNumber: Int?
    var publisherName: String?
    var publishedData: String?
    var subtitle: String?

}
