//
//  QRViewController.swift
//  BarSF
//
//  Created by Zach Smith on 9/2/21.
//  Copyright © 2021 spaceMuleCode. All rights reserved.
//

import UIKit
import AVFoundation

class QRViewController: UIViewController {
    
    var captureSession = AVCaptureSession()
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView: UIView?
    
    private let supportedCodeTypes = [AVMetadataObject.ObjectType.upce,
                                      AVMetadataObject.ObjectType.code39,
                                      AVMetadataObject.ObjectType.code39Mod43,
                                      AVMetadataObject.ObjectType.code93,
                                      AVMetadataObject.ObjectType.code128,
                                      AVMetadataObject.ObjectType.ean8,
                                      AVMetadataObject.ObjectType.ean13,
                                      AVMetadataObject.ObjectType.aztec,
                                      AVMetadataObject.ObjectType.pdf417,
                                      AVMetadataObject.ObjectType.itf14,
                                      AVMetadataObject.ObjectType.dataMatrix,
                                      AVMetadataObject.ObjectType.interleaved2of5,
                                      AVMetadataObject.ObjectType.qr,
]
    
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var topBar: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "QR Stregnth"
        navigationItem.largeTitleDisplayMode = .always
    
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = true
//        navigationController?.navigationBar.largeContentTitle = "true"
//        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
//
//        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.backgroundColor : UIColor.red]
//
//        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.strokeWidth : 2.0]
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapProfile))
        navigationItem.rightBarButtonItem?.tintColor = .red
        // Do any additional setup after loading the view.
    
    
  
        captureSession.startRunning()
        
        // Get the back-facing camera for capturing videos
        guard let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            print("Failed to get the camera device")
            return
        }
        
        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous device object
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            // Set the input device on the capture session
            captureSession.addInput(input)
            
            // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession.addOutput(captureMetadataOutput)
            
            // Set delegate and use the default dispatch queue to execute the call back
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
//            captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
            captureMetadataOutput.metadataObjectTypes = supportedCodeTypes
            
            // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            view.layer.addSublayer(videoPreviewLayer!)
            
            // Start video capture
            captureSession.startRunning()
            
            // Move the message label and top bar to the front
            view.bringSubviewToFront(messageLabel)
//            view.bringSubviewToFront(topBar)
            messageLabel.font = UIFont(name: "din condensed", size: 25)
            messageLabel.textAlignment = .center
            messageLabel.text = """
            Scan a QR Code on a Machine To Get Started
            """
            messageLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            messageLabel.numberOfLines = 2
            messageLabel.frame = CGRect(x: 0, y: view.height/3, width: view.width , height: 140)
            messageLabel.frame.inset(by: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
            messageLabel.backgroundColor = .link
            messageLabel.alpha = 0.5
            navigationController?.navigationBar.isTranslucent = true
            // Initialize QR Code Frame to highlight the QR Code
            qrCodeFrameView = UIView()
            
            if let qrcodeFrameView = qrCodeFrameView {
                qrcodeFrameView.layer.borderColor = UIColor.yellow.cgColor
                qrcodeFrameView.layer.borderWidth = 2
                view.addSubview(qrcodeFrameView)
                view.bringSubviewToFront(qrcodeFrameView)
            }
            
        } catch {
            // If any error occurs, simply print it out and don't continue anymore
            print(error)
            return
        }
    }
    @objc private func didTapProfile() {
        let alert = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet
        )
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
            action in
            
                 // Called when user taps outside
        }))

        alert.addAction(
            .init(title: "Profile", style: .default) { _ in
                let vcOne = self.storyboard?.instantiateViewController(identifier: "ProfileViewController")
                self.present(vcOne ?? ProfileViewController(), animated: true, completion:nil)
                
            }
        )

      
        alert.addAction(
            .init(title: "Personal Trainers", style: .default) { _ in
                let vcOne = self.storyboard?.instantiateViewController(identifier: "redVC")
                self.present(vcOne!, animated: true, completion:nil)
            }
        )
      
        present(alert, animated: true)
        
        alert.addAction(
            .init(title: "Shop(Coming Soon)", style: .default) { _ in
              
            }
        )
        alert.addAction(
            .init(title: "Member Services(Coming Soon)", style: .default) { _ in
              
            }
        )
        
        
        
        
    }
    
}

extension QRViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        // Check metadataObjects array is not nil and it contains at least one object
        if metadataObjects.isEmpty {
            print("------------------------------")
            qrCodeFrameView?.frame = CGRect.zero
            
            captureSession.stopRunning()
            captureSession.startRunning()
            return
        }

     
        // Get the metadata object
        guard let metadataObj = metadataObjects[0] as? AVMetadataMachineReadableCodeObject else {
            return
            
        }
        
        if supportedCodeTypes.contains(metadataObj.type) {
            // If the found metadata is equal to the QR code metadata then update the status label's text and set the bounds
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = barCodeObject!.bounds
            
            switch metadataObj.stringValue {
            case "https://projectbar.page.link/1" :  let vcOne = storyboard?.instantiateViewController(identifier: "GluteatorViewController") ?? WorkOutViewController() as UIViewController
                present(vcOne, animated: true, completion:nil)
            case "https://projectbar.page.link/2" :  let vcOne = storyboard?.instantiateViewController(identifier: "SuperSquatViewController") ?? WorkOutViewController() as UIViewController
                present(vcOne, animated: true, completion:nil)
            case "https://projectbar.page.link/3" :  let vcOne = storyboard?.instantiateViewController(identifier: "StandingLegCurlViewController") ?? WorkOutViewController() as UIViewController
                present(vcOne, animated: true, completion:nil)
            case "https://projectbar.page.link/4" :  let vcOne = storyboard?.instantiateViewController(identifier: "LegExtensionViewController") ?? WorkOutViewController() as UIViewController
                present(vcOne, animated: true, completion:nil)
            case "https://projectbar.page.link/5" :  let vcOne = storyboard?.instantiateViewController(identifier: "SeatedLegCurlViewController") ?? WorkOutViewController() as UIViewController
                present(vcOne, animated: true, completion:nil)
            case "https://projectbar.page.link/6" :  let vcOne = storyboard?.instantiateViewController(identifier: "StandingCalfMachineViewController") ?? WorkOutViewController() as UIViewController
                present(vcOne, animated: true, completion:nil)
            case "https://projectbar.page.link/7" :  let vcOne = storyboard?.instantiateViewController(identifier: "HaxSquatMachineViewController") ?? WorkOutViewController() as UIViewController
                present(vcOne, animated: true, completion:nil)
            case "https://projectbar.page.link/8" :  let vcOne = storyboard?.instantiateViewController(identifier: "LegPressViewController") ?? WorkOutViewController() as UIViewController
                present(vcOne, animated: true, completion:nil)
            case "https://projectbar.page.link/9" :  let vcOne = storyboard?.instantiateViewController(identifier: "BeltSquatViewController") ?? WorkOutViewController() as UIViewController
                present(vcOne, animated: true, completion:nil)
            case "https://projectbar.page.link/10" :  let vcOne = storyboard?.instantiateViewController(identifier: "GluteDriveViewController") ?? WorkOutViewController() as UIViewController
                present(vcOne, animated: true, completion:nil)
            case "https://projectbar.page.link/11" :  let vcOne = storyboard?.instantiateViewController(identifier: "FlatBenchPressViewController") ?? WorkOutViewController() as UIViewController
                present(vcOne, animated: true, completion:nil)
            case "https://projectbar.page.link/12" :  let vcOne = storyboard?.instantiateViewController(identifier: "PeckDeckViewController") ?? WorkOutViewController() as UIViewController
                present(vcOne, animated: true, completion:nil)
            case "https://projectbar.page.link/13" :  let vcOne = storyboard?.instantiateViewController(identifier: "InclinePressViewController") ?? WorkOutViewController() as UIViewController
                present(vcOne, animated: true, completion:nil)
            case "https://projectbar.page.link/14" :  let vcOne = storyboard?.instantiateViewController(identifier: "IsoLaterWideChestViewController") ?? WorkOutViewController() as UIViewController
                present(vcOne, animated: true, completion:nil)
            case "https://projectbar.page.link/15" :  let vcOne = storyboard?.instantiateViewController(identifier: "PowerPressViewController") ?? WorkOutViewController() as UIViewController
                present(vcOne, animated: true, completion:nil)
            case "https://projectbar.page.link/16" :  let vcOne = storyboard?.instantiateViewController(identifier: "IsoLatLowRowViewController") ?? WorkOutViewController() as UIViewController
                present(vcOne, animated: true, completion:nil)
            case "https://projectbar.page.link/17" : performSegue(withIdentifier: "chestSupport", sender: nil)
                
//                let vcOne = storyboard?.instantiateViewController(identifier: "ChestSupporedTBarRowViewController") ?? WorkOutViewController() as UIViewController
//                present(vcOne, animated: true, completion:nil)
            case "https://projectbar.page.link/18" :  let vcOne = storyboard?.instantiateViewController(identifier: "IsoLatDYRowViewController") ?? WorkOutViewController() as UIViewController
                present(vcOne, animated: true, completion:nil)
            default: performSegue(withIdentifier: "wokwok", sender: nil)
            
    
                
                let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject

                if supportedCodeTypes.contains(metadataObj.type) {
                    // If the found metadata is equal to the QR code metadata then update the status label's text and set the bounds
                    let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
                    qrCodeFrameView?.frame = barCodeObject!.bounds

                    guard let url = URL(string: "https://projectbar.page.link/Leg1") else {
                       
                        return
                            }
                        if #available(iOS 10.0, *) {
                   print("leg1")
//                            let vcOne = storyboard?.instantiateViewController(identifier: "GluteatorViewController") ?? WorkOutViewController() as UIViewController
//                              present(vcOne, animated: true, completion:nil)
                            
                        } else {
                           UIApplication.shared.openURL(url)
                        }
//                         messageLabel.text = metadataObj.stringValue
                    }
                }            }
        }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)

        if (captureSession.isRunning == false) {
                captureSession.startRunning()
            }
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)

            if (captureSession.isRunning == true) {
                captureSession.stopRunning()
            }
            
        }

}
