import Foundation

protocol IServerRequestFactory {
    func makeAuthRequestFactory() -> Authorizing
    func makePersonalDataRequestFactory() -> PersonalInformationRequestsFactory
}
