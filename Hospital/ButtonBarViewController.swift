//
//  ButtonBarViewController.swift
//  Hospital
//
//  Created by İrem Çaltı on 26.08.2022.
//

import UIKit
import XLPagerTabStrip

class ButtonBarViewController: ButtonBarPagerTabStripViewController {

    var hospital: Model?
    var isReload = false
    
    @IBOutlet weak var imageDet: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.buttonBarItemTitleColor = .black
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated:Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            
            oldCell?.label.textColor = .black
            newCell?.label.textColor = UIColor(red: 50/255, green: 165/255, blue: 223/255, alpha: 1)
        }
        super.viewDidLoad()
        setupTexts()
        
        buttonBarView.selectedBar.backgroundColor = UIColor(red: 50/255, green: 165/255, blue: 223/255, alpha: 1)
      //  buttonBarView.backgroundColor = .white
    }
    
    func setupTexts() {
        nameLabel.text = hospital?.name
        imageDet.image = UIImage(named: hospital!.imageName)
    }

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
      
        let child_1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "introduction") as! IntroductionViewController
        child_1.hospital = hospital
    
        let child_2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "address") as! AddressViewController
        child_2.hospital = hospital
    return [child_1,child_2]
        }
   
}


    
