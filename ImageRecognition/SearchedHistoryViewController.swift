//
//  SearchedHistoryViewController.swift
//  ImageRecognition
//
//  Created by javon maxwell on 2022-04-12.
//

import UIKit
import Firebase
import FirebaseFirestore
class SearchedHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var tableView: UITableView!
    
    var arr_name = [String]()
    
    var arr_about = [String?]()
    
    var arr_searched = [SearchItem]()
    
    var d1 = SearchItem(name: "lion", about: "heading")
    var d2 = SearchItem(name: "aligator", about: "heading")
    var d3 = SearchItem(name: "dog", about: "heading")
    var d4 = SearchItem(name: "cat", about: "heading")

    override func viewDidLoad()
    {
        super.viewDidLoad()
        readFromDatabase()//fills array with vals from db
        
        fillArray(name: d1.name!, about: d1.about!)
        fillArray(name: d2.name!, about: d2.about!)
        fillArray(name: d3.name!, about: d3.about!)
        fillArray(name: d4.name!, about: d4.about!)
        
        tableView.dataSource = self
        tableView.delegate = self
    
    }
    
    //****************************** Database functions **************************************
    //read from database
       func readFromDatabase()
       {
           let db = Firestore.firestore()
   
           let docRef = db.collection("AnimalFinder")//.document("searches")
   
           let query = docRef.whereField("searched", isEqualTo: true)
               .getDocuments() { (querySnapshot, err) in
                       if let err = err {
                           print("Error getting documents: \(err)")
                       } else {
                           for document in querySnapshot!.documents {
                               //get values from firebase
                               let animType = document.get("name") as! String
                               let animData = document.get("about") as! String
                               print(animData)
                            
                               
                               //store value to array
                               let searched = SearchItem(name: animType, about: animData)
                               self.arr_searched.append(searched)
                               //self.d1 = SearchItem(name: animType, about: animData)
                              // self.arr_searched.append(self.d1)
                           }
                       }
               }
           print(arr_name.count)
        }
        //append an item to array
       func fillArray(name: String, about:String)
       {
           var searched = SearchItem(name: name, about: about)
           arr_searched.append(searched)
       }
    
    
//***************************** tableview functions *********************************
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_searched.count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text =  arr_searched[indexPath.row].name
        cell.detailTextLabel?.text = arr_searched[indexPath.row].about
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row selected")
    }

}
