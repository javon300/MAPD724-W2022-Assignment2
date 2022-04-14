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
import MapKit
import FirebaseFirestore

class habitatViewController: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var animalTypeLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    //value set by segue in view controller
    var passedDetails: String = ""
    
    var animalType: String = ""
    var details: String = ""
    
    var location = CLLocationCoordinate2D(latitude: 51.50007773,longitude: -0.1246402)
    var querry = ""
    
    @Published var animalData: String = ""
    
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //checks for animal name in string
        checkForAnimal(name: passedDetails)
        //readFromDatabase()
       //getLocation(query: querry,locat_place: location)
    }
    
    
    func getLocation(query:String, locat_place: CLLocationCoordinate2D)
    {
        // 2
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: locat_place, span: span)
        mapView.setRegion(region, animated: true)
        //3
        let annotation = MKPointAnnotation()
        annotation.coordinate = locat_place
        annotation.title = query
        annotation.subtitle = "natural habital of the species"
        mapView.addAnnotation(annotation)
    }
    
    
    func checkForAnimal(name: String)
    {
        if (name.contains("cat"))
        {
            readFromDatabase(name: "cat")
            
            // location
            location = CLLocationCoordinate2D(latitude: 51.50007773,longitude: -0.1246402)
            querry = "canada"
            
        }
        else if (name.contains("dog"))
        {
            readFromDatabase(name: "dog")
            
            // location
            location = CLLocationCoordinate2D(latitude: 51.50007773,longitude: -0.1246402)
            querry = "canada"
        }
        else if (name.contains("lion"))
        {
            readFromDatabase(name: "lion")
            
            // location
            location = CLLocationCoordinate2D(latitude: 51.50007773,longitude: -0.1246402)
            querry = "Africa"
        }
        else if (name.contains("tiger"))
        {
            readFromDatabase(name: "tiger")
            
            // location
            location = CLLocationCoordinate2D(latitude: 51.50007773,longitude: -0.1246402)
            querry = "Africa"
        }
        else if (name.contains("alligator"))
        {
            readFromDatabase(name: "alligator")
            
            // location
            location = CLLocationCoordinate2D(latitude: 51.50007773,longitude: -0.1246402)
            querry = "America"
        }
        else if (name.contains("crocodile"))
        {
            readFromDatabase(name: "crocodile")
            
            // location
            location = CLLocationCoordinate2D(latitude: 51.50007773,longitude: -0.1246402)
            querry = "Caribbean"
        }
        else if (name.contains("kangaroo"))
        {
            readFromDatabase(name: "kangaroo")
            
            // location
            location = CLLocationCoordinate2D(latitude: 51.50007773,longitude: -0.1246402)
            querry = "Australia"
        }
        else
        {
            animalType = "NOT AN ANIMAL"
            animalTypeLabel.text = animalType
            let about = "The image you entered is not a registered animal please upload a different picture of an animal"
            detailLabel.text = about
        }
    }
    
    
    //read from database
    func readFromDatabase(name: String)
    {
        let db = Firestore.firestore()

        let docRef = db.collection("AnimalFinder")//.document("searches")
        
        let query = docRef.whereField("name", isEqualTo: name)
            .getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                            let animType = document.get("name") as! String
                            let animData = document.get("about") as! String
                            
                            //sets data in respective labels
                            self.animalTypeLabel.text = animType
                            self.detailLabel.text = animData
                        }
                    }
            }
    
        }

  
}
