import Foundation
import UIKit

class DetailItemVC: UIViewController, DetailItemView {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var goodDescription: UILabel!
    
    var goodId: Int?
    var service: DetailViewModel = DetailViewModel()
    var goodInfo: GetGoodResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let id = goodId {
            service.getGoodInfo(for: id, completionHandler: {[weak self] (recievedGoodInfo, recievedError) in
                if let error = recievedError,
                    let vc = self {
                    Alert.showGoodError(for: vc, error: error)
                    
                } else if let good = recievedGoodInfo {
                    self?.goodInfo = good
                    DispatchQueue.main.async {
                        self?.configure()
                    }
                }
            })
        }
        
    }
    
    func configure() {
        name.text = goodInfo?.name
        price.text = goodInfo?.price.description
        goodDescription.text = goodInfo?.description
    }
}
