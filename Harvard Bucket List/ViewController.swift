//
//  ViewController.swift
//  Harvard Bucket List
//
//  Created by Jason Ren on 10/22/16.
//  Copyright © 2016 Jason Ren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scrollInnerView: UIView!
    
    var dictOfThings : [String:UIImage] = ["Pee on Statue" : #imageLiteral(resourceName: "johnharvard"),
                        "Run naked in Yard" : #imageLiteral(resourceName: "primalscream"),
                        "Flunk a class" : #imageLiteral(resourceName: "flunk"),
                        "Do hackathon" : #imageLiteral(resourceName: "hackathon"),
                        "Strike" : #imageLiteral(resourceName: "strike")]
   
    var tappedString : String = ""
    var tappedPic : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var i = 0
        for (button_name, _) in dictOfThings {
            let button = UIButton(frame: CGRect(x: 100, y: 55*i, width: 150, height: 50))
            button.setTitle(button_name, for: .normal)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
            self.scrollInnerView.addSubview(button)
            i += 1
        }
    }

    func buttonAction(sender: UIButton!) {
        tappedString = sender.currentTitle!
        tappedPic = dictOfThings[tappedString]
        self.performSegue(withIdentifier: "Pee on Harvard", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Pee on Harvard") {
            //get a reference to the destination view controller
            let destinationVC:PeeOnHarvardViewController = segue.destination as! PeeOnHarvardViewController
            
            //set properties on the destination view controller
            destinationVC.toPass = tappedString
            destinationVC.toPass1 = tappedPic
            //etc...
        }
    }
    
    
    


}

