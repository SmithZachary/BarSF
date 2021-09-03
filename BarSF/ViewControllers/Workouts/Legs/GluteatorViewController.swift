//
//  GluteatorViewController.swift
//  BarSF
//
//  Created by Zach Smith on 9/3/21.
//  Copyright © 2021 spaceMuleCode. All rights reserved.
//
import UIKit
import AVKit
import AVFoundation




class GluteatorViewController: UIViewController {
    


private let scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.clipsToBounds = true
    scrollView.showsHorizontalScrollIndicator = false
    scrollView.isScrollEnabled = true
    scrollView.alwaysBounceVertical = true
    scrollView.contentSize = CGSize(width: 200, height: 700)
    
    
    return scrollView
}()


private let textLabel: UILabel = {
    let text = UILabel()
    text.clipsToBounds = true
    text.text = "Gluteator"
    
    text.textAlignment = .center
    
    text.textColor = .white
    text.adjustsFontSizeToFitWidth = true
    text.font = UIFont.boldSystemFont(ofSize: 60.0)
    text.layer.shadowColor = UIColor.black.cgColor
    text.layer.shadowOffset = CGSize(width: 0.0,height: 2.0)
    text.layer.masksToBounds = false
    text.layer.shadowOpacity = 1.0
    text.numberOfLines = 6
    text.lineBreakMode = .byWordWrapping
    text.layer.masksToBounds = true
  
    return text
}()
    private let descriptionLabel: UILabel = {
        let text = UILabel()
        text.clipsToBounds = true
        text.text = "Targeted Muscles"
        text.backgroundColor = .white
        text.textAlignment = .center
       
  
        text.alpha = 0.9
        text.textColor = .black
        text.adjustsFontSizeToFitWidth = true
        text.font = UIFont.boldSystemFont(ofSize: 30)
        text.layer.shadowColor = UIColor.white.cgColor
        text.layer.shadowOffset = CGSize(width: 0.0,height: 2.0)
        text.layer.masksToBounds = false
        text.layer.shadowOpacity = 1.0
        text.numberOfLines = 6
        text.lineBreakMode = .byWordWrapping
        text.layer.masksToBounds = true
      
        return text
    }()
    private let musclesLabel: UILabel = {
        let text = UILabel()
        text.clipsToBounds = true
        text.text = "Gluteus Maximus \n Gluteus Medius \n Gluteus Minimus"
        text.backgroundColor = .white
        text.textAlignment = .center
       
        text.alpha = 0.9
        text.textColor = .black
        text.adjustsFontSizeToFitWidth = true
        text.font = UIFont.systemFont(ofSize: 25)
        text.layer.shadowColor = UIColor.white.cgColor
        text.layer.shadowOffset = CGSize(width: 0.0,height: 2.0)
        text.layer.masksToBounds = false
        text.layer.shadowOpacity = 1.0
        text.numberOfLines = 6
        text.lineBreakMode = .byWordWrapping
        text.layer.masksToBounds = true
      
        return text
    }()
    private let repLabel: UILabel = {
        let text = UILabel()
        text.clipsToBounds = true
        text.text = "Suggested Rep Scheme"
        text.backgroundColor = .white
        text.textAlignment = .center
     
        text.alpha = 0.9
        text.textColor = .black
        text.adjustsFontSizeToFitWidth = true
        text.font = UIFont.boldSystemFont(ofSize: 25)
        text.layer.shadowColor = UIColor.white.cgColor
        text.layer.shadowOffset = CGSize(width: 0.0,height: 2.0)
        text.layer.masksToBounds = false
        text.layer.shadowOpacity = 1.0
        text.numberOfLines = 6
        text.lineBreakMode = .byWordWrapping
        text.layer.masksToBounds = true
      
        return text
    }()
    private let schemeLabel: UILabel = {
        let text = UILabel()
        text.clipsToBounds = true
        text.text = "5X5"
        text.backgroundColor = .white
        text.textAlignment = .center
       
        text.alpha = 0.9
        text.textColor = .black
        text.adjustsFontSizeToFitWidth = true
        text.font = UIFont.systemFont(ofSize: 25)
        text.layer.shadowColor = UIColor.white.cgColor
        text.layer.shadowOffset = CGSize(width: 0.0,height: 2.0)
        text.layer.masksToBounds = false
        text.layer.shadowOpacity = 1.0
        text.numberOfLines = 6
        text.lineBreakMode = .byWordWrapping
        text.layer.masksToBounds = true
      
        return text
    }()
    
    @IBOutlet weak var playv: UIButton!
    
   
  
    let avPlayerViewController = AVPlayerViewController()
    var avPlayer:AVPlayer?


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addBackground()
      
        playv.setTitle("Play Demo", for: .normal)
        playv.layer.backgroundColor = UIColor.white.cgColor
        playv.layer.masksToBounds = true
        playv.layer.cornerRadius = 12
        playv.frame.size = CGSize(width: 200, height: 52)
        playv.setTitleColor(.black, for: .normal)
        playv.contentVerticalAlignment = .center
        playv.center.x = self.view.center.x
      
       
    
       
        
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
        scrollView.addSubview(textLabel)
        scrollView.addSubview(descriptionLabel)
        scrollView.addSubview(musclesLabel)
        scrollView.addSubview(repLabel)
        scrollView.addSubview(schemeLabel)
     
        scrollView.frame = view.bounds
        
       
        textLabel.frame = CGRect(x: 0,
                                 y: 200,
                                 width: scrollView.width,
                                 height: 52)
        descriptionLabel.frame = CGRect(x: (scrollView.center.x)/4,
                                 y: textLabel.bottom+50,
                                 width: 300,
                                 height: 60)
        musclesLabel.frame = CGRect(x: (scrollView.center.x)/4,
                                 y: descriptionLabel.bottom,
                                 width: 300,
                                 height: 100)
        repLabel.frame = CGRect(x: (scrollView.center.x)/4,
                                 y: musclesLabel.bottom+10,
                                 width: 300,
                                 height: 75)
        schemeLabel.frame = CGRect(x: (scrollView.center.x)/4,
                                 y: repLabel.bottom,
                                 width: 300,
                                 height: 75)

       
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


