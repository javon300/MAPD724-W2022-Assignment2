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

    var animal:SearchItem?

    private var service: UserService?
    private var allAnimals = [SearchItem]() {
       didSet {
           DispatchQueue.main.async {
               self.animals = self.allAnimals
           }
       }
    }

    var animals = [SearchItem]() {
       didSet {
           DispatchQueue.main.async {
               self.tableView.reloadData()
           }
       }
    }
    //loads data from database via userService constructor
    func loadData() {
          service = UserService()
          service?.get(collectionID: "AnimalFinder") { tasks in
              self.allAnimals = tasks
          }
      }
    let tableView = UITableView()
      
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupTableView()
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
    }
    
    //sets table constraints
    func setupTableView()
    {
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

    //calculates table length based on input count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
            return animals.count
    }
    let animalsTableIdentifier = "animalsTable"


    //function renders array on app start up
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //instantiaate reusable cell
        var cell = tableView.dequeueReusableCell(withIdentifier: animalsTableIdentifier)
        if(cell == nil)
        {
            //actual instance creation
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: animalsTableIdentifier)
        }

        //adds task title to be displayed
        cell?.textLabel?.text = animals[indexPath.row].name

        //adds date as sudtext
        cell?.detailTextLabel?.text = animals[indexPath.row].about

        //adds image to be displayed in cell
        let editImage = UIImage(named: "marten")
        cell?.imageView?.image = editImage
        return cell!
    }
}
