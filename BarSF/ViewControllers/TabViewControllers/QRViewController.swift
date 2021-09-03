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
//            view.bringSubviewToFront(messageLabel)
//            view.bringSubviewToFront(topBar)
            
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
        let vcOne = storyboard?.instantiateViewController(identifier: "ProfileViewController") as! UIViewController
        present(vcOne, animated: true, completion:nil)
    }}

extension QRViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        // Check if the metadataObjects array is not nil and it contains at least one object
        if metadataObjects.isEmpty {
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
            
            if metadataObj.stringValue != nil {
//                messageLabel.text = metadataObj.stringValue
                let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject

                if supportedCodeTypes.contains(metadataObj.type) {
                    // If the found metadata is equal to the QR code metadata then update the status label's text and set the bounds
                    let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
                    qrCodeFrameView?.frame = barCodeObject!.bounds

                    guard let url = URL(string: metadataObj.stringValue!) else {
                       
                        return
                            }
                        if #available(iOS 10.0, *) {
                    performSegue(withIdentifier: "BackMuscles", sender: nil)
                          
                        } else {
                           UIApplication.shared.openURL(url)
                        }
                        // messageLabel.text = metadataObj.stringValue
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
