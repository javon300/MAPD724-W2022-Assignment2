//
//  habitatViewController.swift
//  ImageRecognition
//
//  Created by javon maxwell on 2022-03-26.
//

import UIKit
import MapKit

class habitatViewController: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var animalTypeLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    var passedDetails: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // vals
        let location = CLLocationCoordinate2D(latitude: 51.50007773,longitude: -0.1246402)
        let querry = "canada"
        
        
        
       getLocation(query: querry,locat_place: location)
        detailLabel.text = passedDetails
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
    
    func animalCheck(animal: String)
    {
        if (animal == "cat")
        {
        
        }
        if (animal == "dog")
        {
            
        }
        if (animal == "lion")
        {
            
        }
        if (animal == "tiger")
        {
            
        }
        if (animal == "aligator")
        {
            
        }
        if (animal == "crocodile")
        {
            
        }
        if (animal == "kangaroo")
        {
            
        }
        
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//           Get the new view controller using segue.destination.
//           Pass the selected object to the new view controller.
//      }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//    {
//
//        guard let detailVC = segue.destination as? ViewController else { return }
//        let details = detailVC.details
//        detailLabel.text = details
//    }
}
