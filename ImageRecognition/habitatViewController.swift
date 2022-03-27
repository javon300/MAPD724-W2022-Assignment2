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
    
    //value set by segue in view controller
    var passedDetails: String = ""
    
    var animalType: String = ""
    var details: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // vals
        let location = CLLocationCoordinate2D(latitude: 51.50007773,longitude: -0.1246402)
        let querry = "canada"
        
        //checks for animal name in string
        checkForAnimal(name: passedDetails)
        
       getLocation(query: querry,locat_place: location)
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
            animalType = "cat"
            animalTypeLabel.text = animalType
            let about = "the household cat. Probably found in your house if not, its in your neighbour's house"
            detailLabel.text = about
        }
        else if (name.contains("dog"))
        {
            animalType = "dog"
            animalTypeLabel.text = animalType
            let about = "the household dog. Probably found in your house if not, its in your neighbour's house"
            detailLabel.text = about
        }
        else if (name.contains("lion"))
        {
            animalType = "lion"
            animalTypeLabel.text = animalType
            let about = "Most commonly found in African jungles. They are present in other regions also such as australia"
            detailLabel.text = about
        }
        else if (name.contains("tiger"))
        {
            animalType = "tiger"
            animalTypeLabel.text = animalType
            let about = "Most commonly found in African jungles. They are present in other regions also such as australia"
            detailLabel.text = about
        }
        else if (name.contains("aligator"))
        {
            animalType = "aligator"
            animalTypeLabel.text = animalType
            let about = "Most commonly found in African jungles. They are present in other regions also such as australia"
            detailLabel.text = about
        }
        else if (name.contains("crocodile"))
        {
            animalType = "crocodile"
            animalTypeLabel.text = animalType
            let about = "Most commonly found in African jungles. They are present in other regions also such as australia"
            detailLabel.text = about
        }
        else if (name.contains("kangaroo"))
        {
            animalType = "Kangaroo"
            animalTypeLabel.text = animalType
            let about = "Most commonly found in Australia grasslands. They are present in other regions also such as Africa"
            detailLabel.text = about
        }
        else
        {
            animalType = "NOT AN ANIMAL"
            animalTypeLabel.text = animalType
            let about = "The image you entered is not a registered animal please upload a different picture of an animal"
            detailLabel.text = about
        }
        
    }

  
}
