//
//  ViewController.swift
//  CameraApp
//
//  Created by Efrain Ayllon on 7/13/16.
//  Copyright © 2016 Efrain Ayllon. All rights reserved.
//

import UIKit
import CoreImage


class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var photoImageView :UIImageView!
    var originalImage :UIImage!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func cameraIconPressed(){
            let alertController = UIAlertController(title: "Pick your poison", message: nil, preferredStyle: .ActionSheet)
            
            let imagePickerViewController = UIImagePickerController()
            imagePickerViewController.delegate = self
            
            let pickFromLibraryAction = UIAlertAction(title: "Pick from Library", style:.Default) { (alert:UIAlertAction) in
                print("You selected to run from Library")
                imagePickerViewController.sourceType = .PhotoLibrary
                self.presentViewController(imagePickerViewController, animated: true, completion: nil)
            }
            
            let takeAPictureAction = UIAlertAction(title: "Take a Picture", style:.Default) { (alert:UIAlertAction) in
                
                print("SMILE :D")
                
                imagePickerViewController.sourceType = .Camera
                self.presentViewController(imagePickerViewController, animated: true, completion: nil)
                
                
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style:.Cancel) { (alert:UIAlertAction) in
            }
            
            alertController.addAction(pickFromLibraryAction)
            alertController.addAction(takeAPictureAction)
            alertController.addAction(cancelAction)
        
            self.presentViewController(alertController, animated: true, completion: nil)

        }
        
        func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[String: AnyObject]){
            
            let originalImage =  info[UIImagePickerControllerOriginalImage] as? UIImage
            
            self.photoImageView.image = originalImage
            
            picker.dismissViewControllerAnimated(true, completion:nil)
            
        }
        
    
    
    
    
    @IBAction func saveImageButton(){
        

        let originalImage = self.photoImageView.image
        
        UIImageWriteToSavedPhotosAlbum(originalImage!, nil, nil, nil)
        
        print("O hai")
        
        
        
        let alert: UIAlertController = UIAlertController(title: "COOL!", message: "Your image has been saved 🎉", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: {(action: UIAlertAction) -> Void in
        }))
        self.presentViewController(alert, animated: true, completion: { _ in })

        
        
        
        
    }
    
        
        
}

