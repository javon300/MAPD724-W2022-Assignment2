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
import CoreML
import Vision
import MaterialComponents.MaterialBottomAppBar

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
   
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var habitatBtn: UIButton!
    @IBOutlet weak var camaraBtn: UIButton!
    @IBOutlet weak var photosBtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var details = ""
    
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
        details = bestGuess
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
        openCamera()
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
        if let img = info[UIImagePickerController.InfoKey.editedImage] as?
        UIImage {
              self.imageView.image = img
              self.dismiss(animated: true, completion: nil)
           }
           else {
              print("error")
           }
    }
    
   
    
    /********************************************************       IDENTIFY IMAGE FUNCTIONS    ****************************************************/
    
    //image picker
    func identifyImage(image: UIImage)
    {
        //setup core ml model for image recognition
        let modelFile = MobileNetV2()
        let model = try! VNCoreMLModel(for: modelFile.model)
        
        //convert UIImage to CIImage
        var newCIImage = CIImage(image: image)!
   
        //assesses image then sends response
        let handler = VNImageRequestHandler(ciImage: newCIImage)
        let request = VNCoreMLRequest(model: model, completionHandler: findResults)
        try! handler.perform([request])
    }
    
    //camera open
    @objc func openCamera()
    {
        let imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        imgPicker.sourceType = .camera
        imgPicker.allowsEditing = false
        imgPicker.showsCameraControls = true
        self.present(imgPicker, animated: true, completion: nil)
    }
    
    
    
    /********************************************************       IDENTIFY IMAGE FUNCTIONS  END    ****************************************************/
    
    
    //data passed using segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "habitatSegue"{
               if let nextViewController = segue.destination as? habitatViewController{
                   nextViewController.passedDetails = details
               }
           }
        
       
        
    }
    
    
    
    
}

