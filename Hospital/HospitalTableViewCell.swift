//
//  HospitalTableViewCell.swift
//  Hospital
//
//  Created by İrem Çaltı on 17.08.2022.
//

import UIKit

protocol CellProtocol {
    func clickedButton(indexPath:IndexPath)
}
class HospitalTableViewCell: UITableViewCell {
    
    var cellProtocol:CellProtocol?
    var indexPath:IndexPath?
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var labelClosedArea: UILabel!
    @IBOutlet weak var labelBedCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
}
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
}
    @IBAction func showMoreButton(_ sender: UIButton) {
       if (labelClosedArea.isHidden && labelBedCount.isHidden){
            labelClosedArea.isHidden = false
            labelBedCount.isHidden = false
            sender.setTitle("Show Less", for: .normal)
        }else{
            labelClosedArea.isHidden = true
            labelBedCount.isHidden = true
            sender.setTitle("Show More", for: .normal)
        }
        cellProtocol?.clickedButton(indexPath: indexPath!)
    }
}
    

