//
//  CameraViewController.swift
//  Camera
//
//  Created by Cameron Reid on 02/09/2016.
//  Copyright © 2016 Cameron Reid. All rights reserved.
//

import UIKit
import CameraManager

public class CameraViewController: UIViewController {

    let cameraManager = CameraManager()
    
    public var saveImage: UIImage?
    
    @IBOutlet weak var cameraView: UIView!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        print("foo")
        cameraManager.shouldRespondToOrientationChanges = false
        cameraManager.cameraOutputMode = .StillImage
        cameraManager.cameraDevice = .Back
        cameraManager.addPreviewLayerToView(self.cameraView)
        cameraManager.writeFilesToPhoneLibrary = true
        cameraManager.capturePictureWithCompletion({ (image, error) -> Void in
            print(image)
        })
    }


    @IBAction func changeCamera(sender: AnyObject) {
        if cameraManager.cameraDevice == .Back {
            cameraManager.cameraDevice = .Front
        } else {
            cameraManager.cameraDevice = .Back
        }
    }

    @IBAction func takePicture(sender: AnyObject) {
        cameraManager.capturePictureWithCompletion({ (image, error) -> Void in
            print(image)
            Entry.sharedEntry.sharedImage = image!
    })
}
}
