//
//  HospitalViewController.swift
//  Hospital
//
//  Created by İrem Çaltı on 17.08.2022.
//

import UIKit
import XLPagerTabStrip

class HospitalViewController: UIViewController {
  
    var hospitalList: [Model] = []
    var fm = FileManager.default
    var fresult: Bool = false
    var subUrl: URL?
    var mainUrl: URL? = Bundle.main.url(forResource: "hospital", withExtension: "json")
    @IBOutlet weak var tableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // labelClosedArea.isHidden = true
       // labelBedCount.isHidden = true
        
        self.title = "Hospitals"
        getData()
        
        tableView.dataSource = self
        tableView.delegate = self
        
}
    override func viewDidAppear(_ animated: Bool) {
          super.viewDidAppear(animated)
          self.tableView.reloadData()
        }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // push with segue
//        if segue.identifier == "toDetail" {
//            if let hospital = sender as? Model {
//                let gidilecekVC = segue.destination as! ViewController
//                gidilecekVC.hospital = hospital
//            }
//        }
// }
    func loadData() {
     // code to load data from network, and refresh the interface
     // tableView.reloadData() -- Direkt yüklüyor
        tableView.beginUpdates() //efektli
        tableView.endUpdates()
    }
   
    func getData() {
        do {
            let documentDirectory = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            loadFile(mainPath: mainUrl!)
        } catch {
            print(error)
        }
    }
    
    func loadFile(mainPath: URL) {
       
            if hospitalList.isEmpty {
                decodeData(pathName: mainPath)
            } else {
            decodeData(pathName: mainPath)
        }
        self.tableView.reloadData()
    }

    func decodeData(pathName: URL) {
        do {
            let jsonData = try Data(contentsOf: pathName)
            let decoder = JSONDecoder()
            hospitalList = try decoder.decode([Model].self, from: jsonData)
        } catch {
            print(error.localizedDescription)
        }
    }
}
extension HospitalViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection secction: Int) -> Int {
        return hospitalList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let hospital = hospitalList[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "hospitalCell", for: indexPath) as! HospitalTableViewCell
        cell.logoImageView.image = UIImage(named: hospital.logoName)
        cell.labelText.text = hospital.name
        cell.labelClosedArea.text = hospital.closedArea + " " + "m2 Closed Area"
        cell.labelBedCount.text = hospital.bedCount + " " + "Bed Count"

        cell.cellProtocol = self
        cell.indexPath = indexPath
//        cell.textLabel?.text = hospitalList[indexPath.row].name // write for without label
//        cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
        cell.selectionStyle = .none //seçimi belli etmedi
        
        return cell
}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let hospital = hospitalList[indexPath.row]
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyBoard.instantiateViewController(withIdentifier: "ButtonBarViewController" ) as? ButtonBarViewController {
            controller.hospital = hospital
         navigationController?.pushViewController(controller, animated: true)
      }
   }
}
extension HospitalViewController: CellProtocol {
    func clickedButton(indexPath: IndexPath) {
        print("button was pressed")
        self.loadData()
    }
}
    
    

    




