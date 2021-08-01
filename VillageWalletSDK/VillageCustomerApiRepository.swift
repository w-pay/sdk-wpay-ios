import UIKit

/**
 Defines the API operations that the SDK can use to call the Customer Village API

 The SDK is technology agnostic with applications being able to choose an implementation that
 meets the needs and preexisting technology choices of the application.

 Implementations of the protocol may provide additional constraints on the user.
 */
public protocol VillageCustomerApiRepository {
	var admin: AdministrationApiRepository { get }
	var dp: DigitalPayRepository { get }
	var instruments: PaymentInstrumentsRepository { get }
	var paymentAgreements: CustomerPaymentAgreementsApiRepository { get }
	var paymentRequests: CustomerPaymentRequestsRepository { get }
	var paymentSessions: CustomerPaymentSessionsRepository { get }
	var preferences: CustomerPreferencesRepository { get }
	var termsAndConditions: CustomerTermsAndConditionsApiRepository { get }
	var transactions: CustomerTransactionsRepository { get }

	/**
	 Options that were given at SDK initialisation
	 */
	var options: VillageCustomerOptions { get }

	/*
	 An `ApiAuthenticator` that can be used to update the access token the SDK uses
	 */
	var authenticator: AnyApiAuthenticator<HasAccessToken> { get }
}
