//
//  WorkoutViewController.swift
//  BarSF
//
//  Created by Zach Smith on 9/2/21.
//  Copyright © 2021 spaceMuleCode. All rights reserved.
//
import UIKit

class WorkOutViewController: UIViewController, UIScrollViewDelegate {
    
 
    private let imageView: UIView = {
        let view = UIView()
        view.addGoldGradient()
        return view
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isScrollEnabled = true
        scrollView.scrollsToTop = true
        scrollView.alwaysBounceVertical = true
        scrollView.contentSize = CGSize(width: 200, height: 600)
        
        
        return scrollView
    }()
    
    
    private let textChest: UILabel = {
        let text = UILabel()
        text.clipsToBounds = true
        text.text = "CHEST"
        text.textAlignment = .center
        text.textColor = .white
        text.adjustsFontSizeToFitWidth = true
        text.font = UIFont.boldSystemFont(ofSize: 20.0)
        text.numberOfLines = 1
        text.backgroundColor = .black
        
        return text
    }()
    private let textBack: UILabel = {
        let text = UILabel()
        text.text = "BACK"
        text.numberOfLines = 1
        text.textAlignment = .center
        text.textColor = .white
        text.backgroundColor = .black
        text.font = UIFont.boldSystemFont(ofSize: 20.0)
        return text
    }()
    private let textLeg: UILabel = {
        let text = UILabel()
        text.text = "LEGS"
        text.numberOfLines = 1
        text.textColor = .white
        text.textAlignment = .center
        text.backgroundColor = .black
        
        text.font = UIFont.boldSystemFont(ofSize: 20.0)
        return text
    }()
    
    private let flatBenchPressButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Flat Bench Press", for: .normal)
       button.addsack(pic: "bench")
        button.contentHorizontalAlignment = .right
        button.contentVerticalAlignment = .top
        button.titleEdgeInsets = UIEdgeInsets(top: 3, left: 0 , bottom: 0, right: 3)
        button.titleLabel?.font = UIFont(name: "din condensed", size: 16)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(flatDidPress), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        button.showsTouchWhenHighlighted = true
        button.setTitleColor(.black, for: .normal)
        
        button.backgroundColor = .white
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.setTitleColor(.black, for: .normal)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = CGSize(width: 1.0,height: 1.0)
        
     
       
        button.layer.shadowOpacity = 1.0
        button.reversesTitleShadowWhenHighlighted = true
        return button
    }()
    private let peckDeckButton: UIButton = {
        let button = UIButton()
        button.setTitle("Peck Deck", for: .normal)
        button.addTarget(self, action: #selector(didTapPeck), for: .touchUpInside)
        button.addsack(pic: "peckdec")
        button.contentHorizontalAlignment = .right
        button.contentVerticalAlignment = .top
        button.titleEdgeInsets = UIEdgeInsets(top: 3, left: 0 , bottom: 0, right: 3)
        button.titleLabel?.font = UIFont(name: "din condensed", size: 16)
        button.layer.masksToBounds = true
        button.setTitleColor(.black, for: .normal)
        button.isUserInteractionEnabled = true
        button.showsTouchWhenHighlighted = true
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
       
        return button
    }()
    private let inclinePressButton: UIButton = {
        let button = UIButton()
        button.setTitle("Incline Press", for: .normal)
        button.addTarget(self, action: #selector(didTapInclinePress), for: .touchUpInside)
        button.layer.masksToBounds = true
        button.addsack(pic: "inclinepress")
        button.contentHorizontalAlignment = .right
        button.contentVerticalAlignment = .top
        button.titleEdgeInsets = UIEdgeInsets(top: 3, left: 0 , bottom: 0, right: 3)
        button.titleLabel?.font = UIFont(name: "din condensed", size: 16)
        button.isUserInteractionEnabled = true
        button.showsTouchWhenHighlighted = true
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
      
        return button
    }()
    private let isoLateralWidePressPressButton: UIButton = {
        let button = UIButton()
        button.setTitle("Iso Lateral Chest Press", for: .normal)
        button.addTarget(self, action: #selector(didTapIsoLat), for: .touchUpInside)
        button.addsack(pic: "widechest")
        button.contentHorizontalAlignment = .right
        button.contentVerticalAlignment = .top
        button.titleEdgeInsets = UIEdgeInsets(top: 3, left: 0 , bottom: 0, right: 3)
        button.titleLabel?.font = UIFont(name: "din condensed", size: 16)
        button.layer.masksToBounds = true
        button.isUserInteractionEnabled = true
        button.showsTouchWhenHighlighted = true
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
        button.contentHorizontalAlignment = .right
        
        return button
    }()
    private let powerPressButton: UIButton = {
        let button = UIButton()
        button.setTitle("Power Press", for: .normal)
        button.addTarget(self, action: #selector(didTapPowerPress), for: .touchUpInside)
        button.addsack(pic: "incline")
        button.contentHorizontalAlignment = .right
        button.contentVerticalAlignment = .top
        button.titleEdgeInsets = UIEdgeInsets(top: 3, left: 0 , bottom: 0, right: 3)
        button.titleLabel?.font = UIFont(name: "din condensed", size: 16)
        button.layer.masksToBounds = true
        button.isUserInteractionEnabled = true
        button.showsTouchWhenHighlighted = true
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
        button.contentHorizontalAlignment = .right
       
        return button
    }()
    private let gluteDriveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Glute /n Drive", for: .normal)
        button.addTarget(self, action: #selector(didTapGluteDrive), for: .touchUpInside)
        button.addsack(pic: "glutedrive")
        button.contentHorizontalAlignment = .right
        button.contentVerticalAlignment = .top
        button.titleEdgeInsets = UIEdgeInsets(top: 3, left: 0 , bottom: 0, right: 3)
        button.titleLabel?.font = UIFont(name: "din condensed", size: 16)
        button.layer.masksToBounds = true
        button.showsTouchWhenHighlighted = true
        button.isUserInteractionEnabled = true
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
        button.contentHorizontalAlignment = .right
        
        return button
    }()
    private let beltSquatButton: UIButton = {
        let button = UIButton()
        button.setTitle("Belt Squat", for: .normal)
        button.addTarget(self, action: #selector(didTapBelt), for: .touchUpInside)
           button.addsack(pic: "beltsquat")
        button.contentHorizontalAlignment = .right
        button.contentVerticalAlignment = .top
        button.titleEdgeInsets = UIEdgeInsets(top: 3, left: 0 , bottom: 0, right: 3)
        button.titleLabel?.font = UIFont(name: "din condensed", size: 16)
        button.layer.masksToBounds = true
        button.showsTouchWhenHighlighted = true
        button.isUserInteractionEnabled = true
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
        
        return button
    }()
    private let legPressButton: UIButton = {
        let button = UIButton()
        button.setTitle("Leg Press", for: .normal)
        button.addTarget(self, action: #selector(didTapLegPress), for: .touchUpInside)
           button.addsack(pic: "legpress")
        button.contentHorizontalAlignment = .right
        button.contentVerticalAlignment = .top
        button.titleEdgeInsets = UIEdgeInsets(top: 3, left: 0 , bottom: 0, right: 3)
        button.titleLabel?.font = UIFont(name: "din condensed", size: 16)
        button.layer.masksToBounds = true
        button.showsTouchWhenHighlighted = true
        button.isUserInteractionEnabled = true
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
       
        return button
    }()
    private let haxSquatButton: UIButton = {
        let button = UIButton()
        button.setTitle("Hax Squat", for: .normal)
        button.addTarget(self, action: #selector(didTapHax), for: .touchUpInside)
           button.addsack(pic: "hax")
        button.contentHorizontalAlignment = .right
        button.contentVerticalAlignment = .top
        button.titleEdgeInsets = UIEdgeInsets(top: 3, left: 0 , bottom: 0, right: 3)
        button.titleLabel?.font = UIFont(name: "din condensed", size: 16)
        button.layer.masksToBounds = true
        button.showsTouchWhenHighlighted = true
        button.isUserInteractionEnabled = true
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    private let standingCalfMachineButton: UIButton = {
        let button = UIButton()
        button.setTitle("Calf Machine", for: .normal)
        button.addTarget(self, action: #selector(didTapCalf), for: .touchUpInside)
           button.addsack(pic: "standingcalf")
        button.contentHorizontalAlignment = .right
        button.contentVerticalAlignment = .top
        button.titleEdgeInsets = UIEdgeInsets(top: 3, left: 0 , bottom: 0, right: 3)
        button.titleLabel?.font = UIFont(name: "din condensed", size: 16)
        button.layer.masksToBounds = true
        button.showsTouchWhenHighlighted = true
        button.isUserInteractionEnabled = true
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
        
        return button
    }()
    private let seatedLegCurlPressButton: UIButton = {
        let button = UIButton()
        button.setTitle("Seated Leg Curl", for: .normal)
        button.addTarget(self, action: #selector(didTapLegCurl), for: .touchUpInside)
           button.addsack(pic: "seatedlegcurl")
        button.contentHorizontalAlignment = .right
        button.contentVerticalAlignment = .top
        button.titleEdgeInsets = UIEdgeInsets(top: 3, left: 0 , bottom: 0, right: 3)
        button.titleLabel?.font = UIFont(name: "din condensed", size: 16)
        button.layer.masksToBounds = true
        button.showsTouchWhenHighlighted = true
        button.isUserInteractionEnabled = true
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
       
        return button
    }()
    private let lyingLegCurlPressButton: UIButton = {
        let button = UIButton()
        button.setTitle("Lying Leg Curl", for: .normal)
        button.addTarget(self, action: #selector(didTapLyingLeg), for: .touchUpInside)
           button.addsack(pic: "lyingleg")
        button.contentHorizontalAlignment = .right
        button.contentVerticalAlignment = .top
        button.titleEdgeInsets = UIEdgeInsets(top: 3, left: 0 , bottom: 0, right: 3)
        button.titleLabel?.font = UIFont(name: "din condensed", size: 16)
        button.layer.masksToBounds = true
        button.showsTouchWhenHighlighted = true
        button.isUserInteractionEnabled = true
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
        
        return button
    }()
    private let legExtensionPressButton: UIButton = {
        let button = UIButton()
        button.setTitle("Leg Extension", for: .normal)
        button.addTarget(self, action: #selector(didTapLegEx), for: .touchUpInside)
           button.addsack(pic: "legextension")
        button.contentHorizontalAlignment = .right
        button.contentVerticalAlignment = .top
        button.titleEdgeInsets = UIEdgeInsets(top: 3, left: 0 , bottom: 0, right: 3)
        button.titleLabel?.font = UIFont(name: "din condensed", size: 16)
        button.layer.masksToBounds = true
        button.showsTouchWhenHighlighted = true
        button.isUserInteractionEnabled = true
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
       
        return button
    }()
    private let inverseCurlButton: UIButton = {
        let button = UIButton()
        button.setTitle("Inverse \n Curl", for: .normal)
        button.addTarget(self, action: #selector(didTapInverse), for: .touchUpInside)
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        button.addsack(pic: "inverse")
        button.contentHorizontalAlignment = .right
        button.contentVerticalAlignment = .top
        button.titleEdgeInsets = UIEdgeInsets(top: 3, left: 0 , bottom: 0, right: 3)
        button.titleLabel?.font = UIFont(name: "din condensed", size: 16)
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor.white.cgColor
        button.showsTouchWhenHighlighted = true
        button.isUserInteractionEnabled = true
        button.setTitleColor(.black, for: .normal)
        
        button.isUserInteractionEnabled = true
        button.isHighlighted = false
        button.showsTouchWhenHighlighted = true
        button.titleLabel?.textAlignment = .center
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
       
        return button
    }()
    private let gluteatorButton: UIButton = {
        let button = UIButton()
        button.setTitle("Gluteator", for: .normal)
        button.addTarget(self, action: #selector(didTapGlute), for: .touchUpInside)
        button.showsTouchWhenHighlighted = true
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
           button.addsack(pic: "gluteator")
        button.contentHorizontalAlignment = .right
        button.contentVerticalAlignment = .top
        button.titleEdgeInsets = UIEdgeInsets(top: 3, left: 0 , bottom: 0, right: 3)
        button.titleLabel?.font = UIFont(name: "din condensed", size: 16)
        button.layer.masksToBounds = true
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
   
        return button
    }()
    private let superSquatPressButton: UIButton = {
        let button = UIButton()
        button.isUserInteractionEnabled = true
        button.isHighlighted = false
        button.showsTouchWhenHighlighted = true
        button.setTitle("Super Squat", for: .normal)
        button.addTarget(self, action: #selector(didTapSuper), for: .touchUpInside)
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
           button.addsack(pic: "incline")
        button.contentHorizontalAlignment = .right
        button.contentVerticalAlignment = .top
        button.titleEdgeInsets = UIEdgeInsets(top: 3, left: 0 , bottom: 0, right: 3)
        button.titleLabel?.font = UIFont(name: "din condensed", size: 16)
        button.layer.masksToBounds = true
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
    
       
        return button
    }()
    private let standingLegCurlPressButton: UIButton = {
        let button = UIButton()
        button.isUserInteractionEnabled = true
        button.isHighlighted = false
        button.setTitle("Standing \n Leg Curl", for: .normal)
        button.addTarget(self, action: #selector(didTapStandingCurl), for: .touchUpInside)
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        button.addsack(pic: "incline")
        button.contentHorizontalAlignment = .right
        button.contentVerticalAlignment = .top
        button.titleEdgeInsets = UIEdgeInsets(top: 3, left: 0 , bottom: 0, right: 3)
        button.titleLabel?.font = UIFont(name: "din condensed", size: 16)
        button.layer.masksToBounds = true
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
        return button
    }()
    
//    back buttons
    private let isoLatLowRow: UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = true
        button.isUserInteractionEnabled = true
        button.isHighlighted = false
        button.setTitle("Iso-Lateral \n Low Row", for: .normal)
        button.addTarget(self, action: #selector(didTapIsoLatLow), for: .touchUpInside)
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        button.addsack(pic: "lowrow")
        button.contentHorizontalAlignment = .right
        button.contentVerticalAlignment = .top
        button.titleEdgeInsets = UIEdgeInsets(top: 3, left: 0 , bottom: 0, right: 3)
        button.titleLabel?.font = UIFont(name: "din condensed", size: 16)
        button.setTitleColor(.black, for: .normal)
        button.showsTouchWhenHighlighted = true
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.backgroundColor = .white
      
        
        return button
    }()
    private let ChestSupportedRow: UIButton = {
        let button = UIButton()
          button.addsack(pic: "chestsupport")
        button.contentHorizontalAlignment = .right
        button.contentVerticalAlignment = .top
        button.titleEdgeInsets = UIEdgeInsets(top: 3, left: 0 , bottom: 0, right: 3)
        button.titleLabel?.font = UIFont(name: "din condensed", size: 16)
        button.isUserInteractionEnabled = true
        button.isHighlighted = false
        button.setTitle("Chest Supported \n Row", for: .normal)
        button.addTarget(self, action: #selector(didTapChestRow), for: .touchUpInside)
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
          button.addsack(pic: "incline")
        button.contentHorizontalAlignment = .right
        button.contentVerticalAlignment = .top
        button.titleEdgeInsets = UIEdgeInsets(top: 3, left: 0 , bottom: 0, right: 3)
        button.titleLabel?.font = UIFont(name: "din condensed", size: 16)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
     
       
        button.layer.masksToBounds = true
       
        return button
    }()

    private let IsoLatDYRow: UIButton = {
        let button = UIButton()
        button.isUserInteractionEnabled = true
        button.isHighlighted = false
        button.setTitle("Iso Lat \n D.Y. Row", for: .normal)
        button.addTarget(self, action: #selector(didTapDYRow), for: .touchUpInside)
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
          button.addsack(pic: "dy")
        button.contentHorizontalAlignment = .right
        button.contentVerticalAlignment = .top
        button.titleEdgeInsets = UIEdgeInsets(top: 3, left: 0 , bottom: 0, right: 3)
        button.titleLabel?.font = UIFont(name: "din condensed", size: 16)
        button.layer.masksToBounds = true
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
  
     
       
        return button
    }()
    
    
    @IBOutlet weak var backScrollVIew: UIScrollView!
    
    
    @IBOutlet weak var chestScrollVIew: UIScrollView!
    
    @IBOutlet weak var legScrollVIew: UIScrollView!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addBackground()
        
   
        
    
        
        scrollView.alwaysBounceVertical = true
//        view.addGoldGradient()
        navigationItem.largeTitleDisplayMode = .always
    
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = true
        title = "THE BAR"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapProfile))
        navigationItem.rightBarButtonItem?.tintColor = .red
        
    
        legScrollVIew.isScrollEnabled = true
        legScrollVIew.alwaysBounceHorizontal = true
        chestScrollVIew.isScrollEnabled = true
        chestScrollVIew.alwaysBounceHorizontal = true
        backScrollVIew.isScrollEnabled = true
        backScrollVIew.alwaysBounceHorizontal = true
        legScrollVIew.isPagingEnabled = true
    
        chestScrollVIew.contentSize = CGSize(width: 1100, height: 100)

        legScrollVIew.contentSize = CGSize(width: 1600, height: 100)
        backScrollVIew.contentSize = CGSize(width:400, height: 100)
        scrollView.contentInset = UIEdgeInsets(top: -50, left: 0.0, bottom: 0.0, right: 0.0)//        chest buttons
        
      
        
        
     
    
        view.addSubview(chestScrollVIew)
        chestScrollVIew.addSubview(flatBenchPressButton)
        chestScrollVIew.addSubview(peckDeckButton)
        chestScrollVIew.addSubview(inclinePressButton)
        chestScrollVIew.addSubview(isoLateralWidePressPressButton)
        chestScrollVIew.addSubview(powerPressButton)
        
        view.addSubview(backScrollVIew)
        backScrollVIew.addSubview(isoLatLowRow)
        backScrollVIew.addSubview(ChestSupportedRow)
        backScrollVIew.addSubview(IsoLatDYRow)
        
        view.addSubview(legScrollVIew)
        legScrollVIew.addSubview(inverseCurlButton)
        legScrollVIew.addSubview(gluteatorButton)
        legScrollVIew.addSubview(superSquatPressButton)
        legScrollVIew.addSubview(standingLegCurlPressButton)
        legScrollVIew.addSubview(legExtensionPressButton)
        legScrollVIew.addSubview(lyingLegCurlPressButton)
        legScrollVIew.addSubview(seatedLegCurlPressButton)
        legScrollVIew.addSubview(standingCalfMachineButton)
        legScrollVIew.addSubview(haxSquatButton)
        legScrollVIew.addSubview(legPressButton)
        legScrollVIew.addSubview(beltSquatButton)
        legScrollVIew.addSubview(gluteatorButton)
    }
    
    @objc private func didTapProfile() {
        let alert = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet
        )
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
            action in
            
                
        }))

        alert.addAction(
            .init(title: "Profile", style: .default) { _ in
                let vcOne = self.storyboard?.instantiateViewController(identifier: "ProfileViewController") as! UIViewController
                self.present(vcOne, animated: true, completion:nil)
                
            }
        )

        alert.addAction(
            .init(title: "Trainers", style: .default) { _ in
                let vc = MySwipeVC()
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
        )
        alert.addAction(
            .init(title: "About", style: .default) { _ in
                let vc = spaceMuleCodeViewController()
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
        )
       
        present(alert, animated: true)
        
        
        
        
        
        
        
    }
    
    @objc func flatDidPress(_ sender: UIButton) {
            
        }
    @objc func didTapPeck(_ sender: UIButton) {
            
        }
    @objc func didTapInclinePress(_ sender: UIButton) {
            
        }
    @objc func didTapIsoLat(_ sender: UIButton) {
            
        }
    @objc func didTapPowerPress(_ sender: UIButton) {
            
        }
    @objc func didTapGluteDrive(_ sender: UIButton) {
        let vcOne = storyboard?.instantiateViewController(identifier: "GluteDriveViewController") ?? WorkOutViewController() as UIViewController
    present(vcOne, animated: true, completion:nil)
        }
    @objc func didTapBelt(_ sender: UIButton) {
        let vcOne = storyboard?.instantiateViewController(identifier: "BeltSquatViewController") ?? WorkOutViewController() as UIViewController
          present(vcOne, animated: true, completion:nil)
        }
    @objc func didTapLegPress(_ sender: UIButton) {
        let vcOne = storyboard?.instantiateViewController(identifier: "LegPressVIewController") ?? WorkOutViewController() as UIViewController
          present(vcOne, animated: true, completion:nil)
        }
    @objc func didTapHax(_ sender: UIButton) {
        let vcOne = storyboard?.instantiateViewController(identifier: "HaxSquatMachineViewController") ?? WorkOutViewController() as UIViewController
          present(vcOne, animated: true, completion:nil)
        }
    @objc func didTapCalf(_ sender: UIButton) {
        let vcOne = storyboard?.instantiateViewController(identifier: "StandingCalfMachineViewController") ?? WorkOutViewController() as UIViewController
          present(vcOne, animated: true, completion:nil)
        }
    
    @objc func didTapLegCurl(_ sender: UIButton) {
        let vcOne = storyboard?.instantiateViewController(identifier: "SeatedLegCurlViewController") ?? WorkOutViewController() as UIViewController
          present(vcOne, animated: true, completion:nil)
        }
    @objc func didTapLyingLeg(_ sender: UIButton) {
        let vcOne = storyboard?.instantiateViewController(identifier: "LyingLegExtensionViewController") ?? WorkOutViewController() as UIViewController
          present(vcOne, animated: true, completion:nil)
        }
    @objc func didTapLegEx(_ sender: UIButton) {
        
        let vcOne = storyboard?.instantiateViewController(identifier: "LegExtensionViewController") ?? WorkOutViewController() as UIViewController
          present(vcOne, animated: true, completion:nil)
            
        }
    @objc func didTapInverse(_ sender: UIButton) {
        let vcOne = storyboard?.instantiateViewController(identifier: "RegistrationViewController") ?? WorkOutViewController() as UIViewController
          present(vcOne, animated: true, completion:nil)
        }
    @objc func didTapGlute(_ sender: UIButton) {
        
      let vcOne = storyboard?.instantiateViewController(identifier: "GluteatorViewController") ?? WorkOutViewController() as UIViewController
        present(vcOne, animated: true, completion:nil)
        
        }
    @objc func didTapSuper(_ sender: UIButton) {
        let vcOne = storyboard?.instantiateViewController(identifier: "SuperSquatViewController") ?? WorkOutViewController() as UIViewController
          present(vcOne, animated: true, completion:nil)
        }
    @objc func didTapStandingCurl(_ sender: UIButton) {
        let vcOne = storyboard?.instantiateViewController(identifier: "StandingLegCurlViewController") ?? WorkOutViewController() as UIViewController
          present(vcOne, animated: true, completion:nil)
        }
    @objc func didTapIsoLatLow(_ sender: UIButton) {
            
        }
    @objc func didTapChestRow(_ sender: UIButton) {
            
        }
    @objc func didTapDYRow(_ sender: UIButton) {
            
        }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]

        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.backgroundColor : UIColor.red]

        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.strokeWidth : 2.0]
        
        scrollView.sendSubviewToBack(scrollView)
        view.addSubview(scrollView)
        scrollView.addSubview(backScrollVIew)
        scrollView.addSubview(chestScrollVIew)
        scrollView.addSubview(legScrollVIew)
       scrollView.addSubview(textChest)
       scrollView.addSubview(textLeg)
      scrollView.addSubview(textBack)
        scrollView.sendSubviewToBack(textBack)
        scrollView.sendSubviewToBack(textLeg)
        scrollView.sendSubviewToBack(textChest)
       
        
        scrollView.frame = view.bounds
        
    
        
        textChest.frame = CGRect (x: chestScrollVIew.left,
                                  y: chestScrollVIew.top - 30,
                                  width: 100, height: 50)
        textBack.frame = CGRect (x:backScrollVIew.left,
                                 y: backScrollVIew.top - 30,
                                 width: 100, height: 50)
        textLeg.frame = CGRect (x: legScrollVIew.left,
                                y: legScrollVIew.top - 30,
                                width: 100 , height: 50)
        
//
//        chestScrollVIew.frame = CGRect(x: 15,
//                                       y: 90,
//                                 width: 800,
//                                 height: 125)
//
//
//        backScrollVIew.frame = CGRect(x: 15,
//                                 y: chestScrollVIew.bottom - 5 ,
//                                 width: 800,
//                                 height: 125)
//
//
//
//        legScrollVIew.frame = CGRect(x: 15,
//                                      y: backScrollVIew.bottom - 6 ,
//                                 width: 800,
//                                 height: 125)
        
      
        
        
       
        isoLatLowRow.frame = CGRect(x: 15,
                                 y: 10,
                                 width: 125,
                                 height: 125)
        ChestSupportedRow.frame = CGRect(x: isoLatLowRow.right + 3,
                                 y: 10
                                 ,
                                 width: 125,
                                 height: 125)
        IsoLatDYRow.frame = CGRect(x: ChestSupportedRow.right + 3,
                                 y: 10,
                                 width: 125,
                                 height: 125)
        
      
        
        flatBenchPressButton.frame = CGRect(x: 15,
                                 y: 10,
                                 width: 125,
                                 height: 125)
        peckDeckButton.frame = CGRect(x: flatBenchPressButton.right + 3,
                                 y: 10
                                 ,
                                 width: 125,
                                 height: 125)
        inclinePressButton.frame = CGRect(x: peckDeckButton.right + 3,
                                 y: 10,
                                 width: 125,
                                 height: 125)
        
        isoLateralWidePressPressButton.frame = CGRect(x: inclinePressButton.right + 3,
                                 y: 10
                                 ,
                                 width: 125,
                                 height: 125)
        powerPressButton.frame = CGRect(x: isoLateralWidePressPressButton.right + 3,
                                 y: 10,
                                 width: 125,
                                 height: 125)
        
//        legs
        
        inverseCurlButton.frame = CGRect(x: 15,
                                 y: 10,
                                 width: 125,
                                 height: 125)
        gluteatorButton.frame = CGRect(x: inverseCurlButton.right + 3,
                                 y: 10
                                 ,
                                 width: 125,
                                 height: 125)
        superSquatPressButton.frame = CGRect(x: gluteatorButton.right + 3,
                                 y: 10,
                                 width: 125,
                                 height: 125)
        standingLegCurlPressButton.frame = CGRect(x: superSquatPressButton.right + 3,
                                 y: 10
                                 ,
                                 width: 125,
                                 height: 125)
        legExtensionPressButton.frame = CGRect(x: standingLegCurlPressButton.right + 3,
                                 y: 10,
                                 width: 125,
                                 height: 125)
        lyingLegCurlPressButton.frame = CGRect(x: legExtensionPressButton.right + 3,
                                 y: 10
                                 ,
                                 width: 125,
                                 height: 125)
        seatedLegCurlPressButton.frame = CGRect(x: lyingLegCurlPressButton.right + 3,
                                 y: 10,
                                 width: 125,
                                 height: 125)
        standingCalfMachineButton.frame = CGRect(x: seatedLegCurlPressButton.right + 3,
                                 y: 10
                                 ,
                                 width: 125,
                                 height: 125)
        haxSquatButton.frame = CGRect(x: standingCalfMachineButton.right + 3,
                                 y: 10,
                                 width: 125,
                                 height: 125)
        legPressButton.frame = CGRect(x: haxSquatButton.right + 3,
                                 y: 10
                                 ,
                                 width: 125,
                                 height: 125)
        beltSquatButton.frame = CGRect(x: legPressButton.right + 3,
                                 y: 10,
                                 width: 125,
                                 height: 125)
//        chestScrollVIew.contentSize = CGSize(width:2000, height: 100)
//
//        legScrollVIew.contentSize = CGSize(width: 3000, height: 100)
//        backScrollVIew.contentSize = CGSize(width:550, height: 100)
//
        
        }
    override func viewWillAppear(_ animated: Bool) {
//        setGradientBackground()
        super.viewWillAppear(animated)
    }
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


