//
//  IntroductionViewController.swift
//  Hospital
//
//  Created by İrem Çaltı on 1.09.2022.
//

import UIKit
import XLPagerTabStrip

class IntroductionViewController: UIViewController, IndicatorInfoProvider {
    
    
    var hospital: Model?
    
    @IBOutlet weak var closedLabel: UILabel!
    @IBOutlet weak var bedLabel: UILabel!
    @IBOutlet weak var weekdayLabel: UILabel!
    @IBOutlet weak var weekendLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    var itemInfo: IndicatorInfo = "Introduction"
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
}
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTexts()
    }

    func setupTexts() {
        titleLabel.text = hospital?.title
        textLabel.text = hospital?.text
        weekdayLabel.text = hospital?.weekDayHours
        weekendLabel.text = hospital?.weekendHours
        closedLabel.text = hospital!.closedArea + " " + "m2 Closed Area"
        bedLabel.text = hospital!.bedCount + " " + "Bed Count"
    }
}



