//Author Name: Aishwarya Shrestha
//Student ID: 301138662
//Email ID: ashres15@my.centennialcollege.ca

//Author Name: Keshav Dulal
//Student ID: 301209947
//Email ID: kdulal1@my.centennialcollege.ca

//Author Name: Poojan Jitendrakumar Patel
//Student ID: 301228811
//Email ID: ppate821@my.centennialcollege.ca

//Author Name: Matthew Maxwell
//Student ID: 301200258
//Email ID: mmaxwel7@my.centennialcollege.ca



import UIKit
import Firebase
import FirebaseFirestore

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableView = UITableView()
    var arr_searched = [SearchItem]()
    
    // String table identifier
   let tasksTableIdentifier = "tasksTable"
  
   //db reference
   var docRef: DocumentReference!
    private var service: UserService?
       private var allsearches = [SearchItem]() {
           didSet {
               DispatchQueue.main.async {
                   self.searches = self.allsearches
               }
           }
       }

       var searches = [SearchItem]() {
           didSet {
               DispatchQueue.main.async {
                   self.tableView.reloadData()
               }
           }
       }

    func loadData() {
             service = UserService()
             service?.get(collectionID: "AnimalFinder") { animal in
                 self.allsearches = animal
             }
         }
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupTableView()
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
       // readFromDatabase()
    }
    
    
  //********************************* TABLE VIEW SETUP ***************************************

    func setupTableView() {
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.allowsSelection = true
        tableView.isUserInteractionEnabled = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return arr_searched.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
          cell.accessoryType = .disclosureIndicator
          cell.textLabel?.text = arr_searched[indexPath.row].name
          cell.textLabel?.font = .systemFont(ofSize: 20, weight: .medium)
          cell.detailTextLabel?.text = arr_searched[indexPath.row].about
          return cell
      }
    
//    //function renders array on app start up
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
//
//
//            //instantiaate reusable cell
//            var cell = tableView.dequeueReusableCell(withIdentifier: tasksTableIdentifier)
//            let searched: SearchItem
//            searched = arr_searched[indexPath.row]
//            if(cell == nil)
//            {
//                //actual instance creation
//                cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: tasksTableIdentifier)
//            }
//
//            //adds task title to be displayed
//            cell?.textLabel?.text = searched.name
//
//            //adds date as sudtext
//        cell?.detailTextLabel?.text = searched.about
//
////            //adds image to be displayed in cell
////            let editImage = UIImage(named: "edit")
////            cell?.imageView?.image = editImage
//
//            return cell!
//        }
    //********************************* TABLE VIEW SETUP END ***************************************
    
//    //read from database
//    func readFromDatabase()
//    {
//        let db = Firestore.firestore()
//
//        let docRef = db.collection("AnimalFinder")//.document("searches")
//
//        let query = docRef.whereField("searched", isEqualTo: true)
//            .getDocuments() { (querySnapshot, err) in
//                    if let err = err {
//                        print("Error getting documents: \(err)")
//                    } else {
//                        for document in querySnapshot!.documents {
//                            let animType = document.get("name") as! String
//                            let animData = document.get("about") as! String
//
//                            //sets data in respective labels
//
//                            self.fillArray(name: animType, about: animData)
//
//                            print("\(document.documentID) => \(document.data())")
//                        }
//                    }
//            }
//
//        }
//
//    func fillArray(name: String, about:String)
//    {
//        var searched = SearchItem(name: name, about: about)
//        arr_searched.append(searched)
//    }

}
