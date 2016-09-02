//
//  ViewController.swift
//  Camera
//
//  Created by Cameron Reid on 02/09/2016.
//  Copyright © 2016 Cameron Reid. All rights reserved.
//

import UIKit
import CameraManager

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    
    @IBOutlet weak var pickButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    

    let imagePicker = UIImagePickerController()
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        print(Entry.sharedEntry.sharedImage)
        
    }
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] {
            
            Entry.sharedEntry.sharedImage = image as? UIImage
            imageView.image = image as? UIImage
            print(image)
            
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    @IBAction func pickPressed(sender: AnyObject) {
        print("Hello World")
        

        let alertViewController = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        alertViewController.addAction(UIAlertAction(title: "Pick a picture", style: UIAlertActionStyle.Default, handler:  { action in
            

            print("Pick a picture")
            self.imagePicker.sourceType = .PhotoLibrary
            self.imagePicker.allowsEditing = false
            self.presentViewController(self.imagePicker, animated: true, completion: nil)

            
        }))
        alertViewController.addAction(UIAlertAction(title: "Take a picture", style: UIAlertActionStyle.Default, handler: {
            [unowned self] action in
            
            self.performSegueWithIdentifier("takePicture", sender: alertViewController)
            
        }))
        alertViewController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Destructive, handler: {
            [unowned self] action in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
            }))
        
        presentViewController(alertViewController, animated: true, completion: nil)

    }
    
    override func viewDidAppear(animated: Bool) {
        

        guard let testImage = Entry.sharedEntry.sharedImage else { return }
        
            imageView.image = testImage
            print(Entry.sharedEntry.sharedImage)
        
        }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self

        

}

}

