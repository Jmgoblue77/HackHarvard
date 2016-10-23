//
//  PeeOnHarvardViewController.swift
//  Harvard Bucket List
//
//  Created by Jason Ren on 10/22/16.
//  Copyright © 2016 Jason Ren. All rights reserved.
//

import UIKit

class PeeOnHarvardViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var imagePicker : UIImagePickerController!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var topLabel: UILabel!
    
    //Passed text from button on home screen
    var toPass:String!
    var toPass1:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topLabel.text = self.toPass
    }

    
    @IBAction func takePhoto(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            imageView.image = self.toPass1
            
        }
        
        
        
    }
    
    private func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismiss(animated: true, completion: nil)
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        self.performSegue(withIdentifier: "Back Home", sender: self)
    }

}
