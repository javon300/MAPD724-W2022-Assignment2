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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //stores image file
        let imagePath = Bundle.main.path(forResource: "car1", ofType: "jpeg")
        let imageURL = NSURL.fileURL(withPath: imagePath!)
        
        //setup core ml model for image recognition
        let modelFile = MobileNetV2()
        let model = try! VNCoreMLModel(for: modelFile.model)
     
        //get result from calling core-ml with image
        let handler = VNImageRequestHandler(url: imageURL)
        let request = VNCoreMLRequest(model: model, completionHandler: findResults)
        try! handler.perform([request])
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
    
    @IBAction func camaraPressed(_ sender: Any)
    {
        
    }
    
    @IBAction func habitatBtnPressed(_ sender: Any)
    {
        
    }
    
    
    /********************************************************       BUTTON PRESSED FUNCTIONS  END    ****************************************************/
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        picker.dismiss(animated: true, completion: nil)

        if let image = info[.originalImage] as? UIImage
        {
            imageView.image = image
        }
    }


}

