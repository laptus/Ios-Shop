import Foundation
import UIKit

class CatalogViewModel: NSObject, UITableViewDataSource, UITableViewDelegate {
    var goods: [GoodOnPageResult] = []
    var catalogService: CatalogRequestsFactory
    
    override init() {
        catalogService = GBShopServicesFactory().makeCatalogRequestsFactory()
        super.init()
    }
    
    func getGoods(completionHandler: @escaping((_ error: Error?) -> Void)) {
        catalogService.goods(page: 1, categoryId: 1, completionHandler: {[weak self] result in
            var error: Error?
            switch result.result {
            case .success(let data):
                self?.goods = []
                self?.goods.append(contentsOf: data)
                
            case .failure(let recievedError):
                error = recievedError
            }
            DispatchQueue.main.async {
                completionHandler(error)
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goods.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "goodCell", for: indexPath)
            as! GoodCell
        cell.price.text = String(goods[indexPath.row].price)
        cell.name.text = goods[indexPath.row].name
        cell.id.text = String(goods[indexPath.row].id)
        return cell
    }
    
}
