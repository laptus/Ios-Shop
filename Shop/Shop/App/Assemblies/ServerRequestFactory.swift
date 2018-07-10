import Foundation

protocol IServerRequestFactory {
    func makeAuthRequestFactory() -> AuthRequestsFactory
    func makePersonalDataRequestFactory() -> PersonalInformationRequestsFactory
}
