import UIKit

class CatalogTableVC: UIViewController, CatalogView {
    var onItemSelected: ((Int) -> Void)?
        
    
    @IBOutlet weak var goodsTable: UITableView!
    var catalogViewModel: CatalogViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catalogViewModel = CatalogViewModel()
        catalogViewModel?.onItemSelected = onItemSelected
        goodsTable.delegate = catalogViewModel
        goodsTable.dataSource = catalogViewModel
        goodsTable.refreshControl = UIRefreshControl()
        goodsTable.refreshControl?.addTarget(self, action: #selector(refreshTable), for: .primaryActionTriggered)
        loadGoods()

    }

    @objc func refreshTable() {
        loadGoods()
    }
    
    func loadGoods() {
        catalogViewModel?.getGoods(completionHandler: {[weak self] recievedError in
            if let error = recievedError {
                if let vc = self {
                    Alert.showCatalagError(for: vc, error: error)
                }
            } else {
                self?.goodsTable.reloadData()
            }
        })
    }
}
