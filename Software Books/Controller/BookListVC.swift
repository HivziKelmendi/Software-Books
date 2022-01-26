//
//  BookListVC.swift
//  Software Books
//
//  Created by Hivzi on 5.1.22.
//

import UIKit

class BookListVC: UIViewController {
    
    var books = [Item]()
  

    var networking =  Networking()
    var selectedCategory: String?
      
    @IBOutlet weak var tableView: UITableView! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "BookListTableViewCell", bundle: nil),        forCellReuseIdentifier: "ReusableBookCell")
         networking.delegate = self
       
        
    }
      
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if  let SafeSelectedCategory = selectedCategory  {

            networking.getBooks(for: SafeSelectedCategory)
        }
        

    }
    }
    
  
extension BookListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       performSegue(withIdentifier: "goToBookInfo", sender: self)
       }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! BookInfoVC
        if let indexPath = tableView.indexPathForSelectedRow {
            let book = books[indexPath.row].volumeInfo
          
            destinationVC.title1 = book.title
            destinationVC.author1 = book.authors?[0]
            if book.authors?.count ?? 1 > 1 {
                destinationVC.author2 = book.authors![1]
            }
            destinationVC.publisherName = book.publisher
            destinationVC.publishedData = book.publishedDate
            
            destinationVC.pageNumber = book.pageCount ?? 0
            destinationVC.descript = book.description ?? ""
            
          
            
            
            guard  books[indexPath.row].volumeInfo.imageLinks.thumbnail  != nil else { return }
            let url = URL(string: books[indexPath.row].volumeInfo.imageLinks.smallThumbnail! )
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: url!) { data, response, error in
                if error == nil && data != nil {
                    let image = UIImage(data: data!)
                    destinationVC.imageVariable = image
                    
                }
            }
            dataTask.resume()
            
        }
    }
}

extension BookListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableBookCell", for: indexPath) as! BookListTableViewCell
        DispatchQueue.main.async
        {
            let book = self.books[indexPath.row]
            cell.updateCell(from: book)
           
        }
        return cell
    }
}


    

extension BookListVC: NetworkingDelegate {
    func booksFatched(booklist: [Item]) {
        self.books = booklist
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }

    }
}
