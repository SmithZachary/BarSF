//
//  LegExtensionViewController.swift
//  BarSF
//
//  Created by Zach Smith on 9/3/21.
//  Copyright © 2021 spaceMuleCode. All rights reserved.
//

import UIKit
import AVKit

class LegExtensionViewController: UIViewController {

    private let imageView: UIView = {
        let button   = UIView()
        button.addImage(pic: "legextension")
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12
        button.backgroundColor = .white
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 2.0,height: 2.0)
        button.layer.shadowOffset = CGSize(width: -2.0,height: -2.0)
        button.layer.masksToBounds = false
        button.layer.shadowOpacity = 1.0
        
        return button
    }()

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isScrollEnabled = true
        scrollView.alwaysBounceVertical = true
     
        return scrollView
    }()
    private let smallView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.layer.shadowColor = UIColor.black.cgColor
        scrollView.layer.shadowOffset = CGSize(width: 2.0,height: 2.0)
        scrollView.layer.shadowOffset = CGSize(width: -2.0,height: -2.0)
        scrollView.layer.masksToBounds = false
        scrollView.layer.shadowOpacity = 1.0
        
        return scrollView
    }()

    private let playLabel: UILabel = {
        let text = UILabel()
        text.clipsToBounds = true
        text.text = ""
        text.numberOfLines = 0
        text.sizeToFit()
        text.textAlignment = .center
        text.textColor = .red
        text.adjustsFontSizeToFitWidth = true
        text.font = UIFont.boldSystemFont(ofSize: 25.0)
        text.layer.shadowColor = UIColor.black.cgColor
        text.layer.shadowOffset = CGSize(width: 0.0,height: 2.0)
        text.layer.masksToBounds = false
        text.layer.shadowOpacity = 1.0
     
        text.lineBreakMode = .byWordWrapping
        text.layer.masksToBounds = true
        
        return text
    }()
    private let demoLabel: UILabel = {
        let text = UILabel()
        text.clipsToBounds = true
        text.text = "PLAY DEMO"
        text.numberOfLines = 0
        text.sizeToFit()
        text.textAlignment = .center
        text.textColor = .red
        text.adjustsFontSizeToFitWidth = true
        text.font = UIFont.boldSystemFont(ofSize: 12.0)
        text.layer.shadowColor = UIColor.black.cgColor
        text.layer.shadowOffset = CGSize(width: 0.0,height: 2.0)
        text.layer.masksToBounds = false
        text.layer.shadowOpacity = 1.0
     
        text.lineBreakMode = .byWordWrapping
        text.layer.masksToBounds = true
        
        return text
    }()
    private let textLabel: UILabel = {
        let text = UILabel()
        text.clipsToBounds = true
        text.text = "Leg Extension"
        text.numberOfLines = 0
        text.sizeToFit()
        text.textAlignment = .center
        text.textColor = .white
        text.layer.shadowColor = UIColor.black.cgColor
        text.layer.shadowOffset = CGSize(width: 0.0,height: 2.0)
        text.layer.masksToBounds = false
        text.layer.shadowOpacity = 1.0
        text.adjustsFontSizeToFitWidth = true
        text.font = UIFont.boldSystemFont(ofSize: 25.0)
      
      
     
        text.lineBreakMode = .byWordWrapping
        text.layer.masksToBounds = true
        
        return text
    }()
 
        private let descriptionLabel: UILabel = {
            let text = UILabel()
            text.clipsToBounds = true
            text.text = "Targeted Muscles"
            text.numberOfLines = 0
            text.sizeToFit()
            text.textAlignment = .center
            text.textColor = .white
            text.layer.shadowColor = UIColor.black.cgColor
            text.layer.shadowOffset = CGSize(width: 0.0,height: 2.0)
            text.layer.masksToBounds = false
            text.layer.shadowOpacity = 1.0
            text.adjustsFontSizeToFitWidth = true
            text.font = UIFont.boldSystemFont(ofSize: 25.0)
            return text
        }()
        private let musclesLabel: UILabel = {
            let text = UILabel()
            text.text = "- Quadriceps Femoris"
            text.textAlignment = .left
            text.textColor = .black
            text.adjustsFontSizeToFitWidth = true
            text.font = UIFont.systemFont(ofSize: 20)
            text.layer.shadowColor = UIColor.white.cgColor
            text.layer.shadowOffset = CGSize(width: 0.0,height: 2.0)
            text.layer.shadowOpacity = 1.0
            text.numberOfLines = 6
            text.lineBreakMode = .byWordWrapping
            return text
        }()
        private let repLabel: UILabel = {
            let text = UILabel()
            text.clipsToBounds = true
            text.text = "Rep Range"
            text.numberOfLines = 0
            text.sizeToFit()
            text.textAlignment = .center
            text.textColor = .white
            text.layer.shadowColor = UIColor.black.cgColor
            text.layer.shadowOffset = CGSize(width: 0.0,height: 2.0)
            text.layer.masksToBounds = false
            text.layer.shadowOpacity = 1.0
            text.adjustsFontSizeToFitWidth = true
            text.font = UIFont.boldSystemFont(ofSize: 25.0)
           
            return text
        }()
        private let schemeLabel: UILabel = {
            let text = UILabel()

            text.text = "5 - 20"
            text.textAlignment = .left
            text.textColor = .black
            text.adjustsFontSizeToFitWidth = true
            text.font = UIFont.systemFont(ofSize: 20)
            text.layer.shadowColor = UIColor.white.cgColor
            text.layer.shadowOffset = CGSize(width: 0.0,height: 2.0)
            text.layer.shadowOpacity = 1.0
            text.numberOfLines = 6
            text.lineBreakMode = .byWordWrapping
          
            return text
        }()
        
        @IBOutlet weak var playv: UIButton!
        
       
      
        let avPlayerViewController = AVPlayerViewController()
        var avPlayer:AVPlayer?


        override func viewDidLoad() {
            super.viewDidLoad()
            self.view.addBackground()
          
            playv.setBackgroundImage(UIImage(named: "playbtn"), for: .normal)
            playv.contentMode = UIView.ContentMode.scaleAspectFill
            playv.setTitle(" ", for: .normal)
        
        
          
            playv.setTitleColor(.black, for: .normal)
            playv.contentVerticalAlignment = .center
//            playv.center.x = self.view.center.x
//            playv.center.y = self.view.bottom - 200
            playv.layer.masksToBounds = true
          
           
        
           
            
            let movieUrl:NSURL? = NSURL(string: "https://firebasestorage.googleapis.com/v0/b/projectbar-mule.appspot.com/o/Leg1.MOV?alt=media&token=b403fe4f-613e-4b54-9dd3-c3bc67d4e1e1")
            if let url = movieUrl {
            self.avPlayer = AVPlayer(url: url as URL)
            self.avPlayerViewController.player = self.avPlayer
            }
            NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: avPlayerViewController.player?.currentItem)
            
            
            self.present(self.avPlayerViewController, animated: true) { () -> Void in
                    self.avPlayerViewController.player?.play()        // Do any additional setup after loading the view.
            }
        }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addSubview(scrollView)
        view.bringSubviewToFront(playv)
        scrollView.addSubview(smallView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(playv)
        scrollView.addSubview(textLabel)
        scrollView.addSubview(descriptionLabel)
        scrollView.addSubview(musclesLabel)
        scrollView.addSubview(demoLabel)
        scrollView.frame = view.bounds
       

        let size = scrollView.width/3
        textLabel.center = scrollView.center
        textLabel.frame = CGRect(x:(scrollView.width-size)/2 - 60 ,
                                 y: scrollView.height/10,
                                 width: size + 120,
                                 height: 104)
        
        playv.layer.cornerRadius = playv.width/2.0
        
       
        
        descriptionLabel.frame = CGRect(x:(scrollView.width-size)/2 - 60 ,
                                        y: textLabel.bottom,
                                 width: size + 120,
                                 height: 52)
        musclesLabel.frame = CGRect(x:(scrollView.width-size)/2 - 60 ,
                                    y: descriptionLabel.bottom,
                                 width: size + 120,
                                 height: 104)
       
       demoLabel.frame = CGRect(x: (scrollView.width-size)/2 ,
                                 y: playv.bottom,
                                 width: size,
                                 height: 52)
        
//            play button and image
        smallView.frame = CGRect(x: 0,
                                 y: musclesLabel.bottom,
                                 width: scrollView.width,
                                          height: 300)
        playv.frame = CGRect(x: (scrollView.width-size)/2 + 40,
                             y: smallView.center.y,
                                      width: size - 80,
                                      height: playv.width)
        
        imageView.frame = CGRect(x: (scrollView.width-size)/2 - 100,
                                 y: musclesLabel.bottom,
                                 width: size + 200,
                                          height: 300)


       
    }
        
        @objc func playerDidFinishPlaying(note: NSNotification) {
                self.avPlayerViewController.dismiss(animated: true)
            }
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()

        }
        @IBAction func playV(sender: UIButton) {
           
                

             
                  
                    let amovieUrl:NSURL? = NSURL(string: "https://firebasestorage.googleapis.com/v0/b/projectbar-mule.appspot.com/o/Leg1.MOV?alt=media&token=b403fe4f-613e-4b54-9dd3-c3bc67d4e1e1")
                    if let aurl = amovieUrl {
                        self.avPlayer = AVPlayer(url: aurl as URL)
                    self.avPlayerViewController.player = self.avPlayer
                
        self.present(self.avPlayerViewController, animated: true) { () -> Void in
                self.avPlayerViewController.player?.play()

           
        }

        }
    }
        
          // Do any additional setup after loading the view.
        }
        

        /*
        // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        */


