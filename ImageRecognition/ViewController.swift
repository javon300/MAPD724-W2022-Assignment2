//
//  ViewController.swift
//  ImageRecognition
//
//  Created by javon maxwell on 2022-03-24.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    @IBOutlet weak var labelDescription: UILabel!
    
    @IBOutlet weak var habitatBtn: UIButton!
    @IBOutlet weak var camaraBtn: UIButton!
    @IBOutlet weak var photosBtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    let sb = UIStoryboard(name: "Main", bundle: nil)
         
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    //find result in core ml
    func findResults(request: VNRequest, error: Error?) {
       guard let results = request.results as?
       [VNClassificationObservation] else {
       fatalError("Unable to get results")
       }
       var bestGuess = ""
       var bestConfidence: VNConfidence = 0
       for classification in results {
          if (classification.confidence > bestConfidence) {
             bestConfidence = classification.confidence
             bestGuess = classification.identifier
          }
       }
       labelDescription.text = "Image is: \(bestGuess) with confidence \(bestConfidence) out of 1"
    }
    
    
    /********************************************************       BUTTON PRESSED FUNCTIONS   ****************************************************/
    //calls image picker and sets a new image
    @IBAction func PhotosBtnPressed(_ sender: Any)
    {
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.sourceType = .photoLibrary
        imagePickerVC.delegate = self // new
        present(imagePickerVC, animated: true)
        
        
    }
    
    //opens camera when pressed
    @IBAction func camaraPressed(_ sender: Any)
    {
        
    }
    
    //opens map after user
    @IBAction func habitatBtnPressed(_ sender: Any)
    {
       
    }
    /********************************************************       BUTTON PRESSED FUNCTIONS  END    ****************************************************/
    
    //controls image picker after image is selected
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        picker.dismiss(animated: true, completion: nil)
        
        //sets image view with image
        if let image = info[.originalImage] as? UIImage
        {
            imageView.image = image

            print("image url" + image.description)
            identifyImage(image: image)
        }
   
        
    }
    
    func identifyImage(image: UIImage)
    {
        //stores image file
        let imagePath = Bundle.main.path(forResource: "bird2", ofType: "jpeg")
        
        let imageURL = NSURL.fileURL(withPath: imagePath!)
        
        //setup core ml model for image recognition
        let modelFile = MobileNetV2()
        let model = try! VNCoreMLModel(for: modelFile.model)
     
        var newCIImage = CIImage(image: image)!
        //where image is a UIImage
        
//        //get result from calling core-ml with image
//        let handler = VNImageRequestHandler(url: imageURL)
//        let request = VNCoreMLRequest(model: model, completionHandler: findResults)
//        try! handler.perform([request])
        
        let handler2 = VNImageRequestHandler(ciImage: newCIImage)
        let request = VNCoreMLRequest(model: model, completionHandler: findResults)
        try! handler2.perform([request])
    }

    
    
}

