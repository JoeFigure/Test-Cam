//
//  AVViewController.swift
//  Test Cam
//
//  Created by Joe Kletz on 18/10/2015.
//  Copyright © 2015 Joe Kletz. All rights reserved.
/*
  http://jamesonquave.com/blog/taking-control-of-the-iphone-camera-in-ios-8-with-swift-part-1/
*/
//


import UIKit
import AVFoundation

class AVViewController: UIViewController {
    
   
    let captureSession = AVCaptureSession()
    
    var captureDevice : AVCaptureDevice?
    
    //let mongView = myView(frame:CGRectMake(21.0, 12.0, 20.0, 20.0))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        captureSession.sessionPreset = AVCaptureSessionPresetLow
        let devices = AVCaptureDevice.devices()
        //print(devices)
        
        // Loop through all the capture devices on this phone
        for device in devices {
            // Make sure this particular device supports video
            if (device.hasMediaType(AVMediaTypeVideo)) {
                // Finally check the position and confirm we've got the back camera
                if(device.position == AVCaptureDevicePosition.Back) {
                    captureDevice = device as? AVCaptureDevice
                }
            }
        }
        
        print(captureDevice)
        
        if captureDevice != nil {
            beginSession()
        }
        
        //self.view.addSubview(mongView)
    }
    
    func beginSession() {
        
        do{
            captureSession.addInput( try AVCaptureDeviceInput(device: captureDevice))
        } catch _ {
            print("error")
        }
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.position = CGPoint(x: 1, y: 20)
        self.view.layer.addSublayer(previewLayer)
        //previewLayer?.frame = self.view.layer.frame
        previewLayer.frame = CGRect(x: 20, y: 20, width: 100, height: 500)
        captureSession.startRunning()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func TakePhoto(sender: UIButton) {
        //AVCaptureStillImageOutput
    }
    
}