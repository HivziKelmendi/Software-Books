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
        print("viewDidLoad")
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
        print(booklist)
        self.books = booklist
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }

    }
}
