class DetailViewModel: Analytics {
    var service = GBShopServicesFactory.instance().makeCatalogRequestsFactory()
    
    func getGoodInfo(for id: Int, completionHandler: @escaping ((GetGoodResult?, Errors?) -> Void)) {
        service.good(goodId: id, completionHandler: {[weak self] response in
            switch response.result {
            case .success(let goodInfo):
                completionHandler(goodInfo, nil)
                self?.track(AnalyticsEvent.catalog(moethod: AnalyticsEvent.CatalogMethods.getGood, success: true))
            case .failure :
                completionHandler(nil, Errors(type: ErrorTypes.wrongRequest))
                self?.track(AnalyticsEvent.catalog(moethod: AnalyticsEvent.CatalogMethods.getGood, success: false))
            }
        })
    }
}
