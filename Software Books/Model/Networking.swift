//
//  Networking.swift
//  Software Books
//
//  Created by Hivzi on 11.1.22.
//

import Foundation

protocol NetworkingDelegate {
    func booksFatched(booklist: [Item])
}

struct Networking {
    
    var delegate: NetworkingDelegate?
    let baseURL = "https://www.googleapis.com/books/v1/volumes?q="
    func getBooks (for bookName: String) {
        let endpoint = baseURL + "\(bookName)&programming&language&maxResults=40"
        guard let url = URL(string: endpoint)  else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?)  in
             if error != nil {
                 print(error!)
                 
                 return }

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            return}
                 
        guard let data = data else {  print("Ska shenime")
                                            return }

            
            var json: Book?
                 do {
                     json = try JSONDecoder().decode(Book.self, from: data)
                    
                 }    catch {
                     print("error")
                 }
            guard let result = json else {return}
            let booklist = result.items
            self.delegate?.booksFatched(booklist: result.items)
            print(result.items[0].volumeInfo.imageLinks.smallThumbnail)
             }
      
        task.resume()
}
}

