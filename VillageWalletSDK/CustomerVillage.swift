import UIKit

/**
 * Entry point into the SDK. It is responsible for managing the relationship between app
 * concerns, and calling the API.
 */
public class CustomerVillage<A>: Configurable {
	private let api: VillageCustomerApiRepository
	private let authenticator: AnyApiAuthenticator<A>

	public init(api: VillageCustomerApiRepository, authenticator: AnyApiAuthenticator<A>) {
		self.api = api
		self.authenticator = authenticator
	}

	public func authenticate(completion: @escaping ApiResult<A>) {
		return authenticator.authenticate(completion: completion)
	}

	public func retrievePaymentRequestDetailsBy(
		qrCodeId: String,
		completion: @escaping ApiResult<CustomerPaymentRequest>
	) -> Void {
		api.retrievePaymentRequestDetailsBy(
			qrCodeId: qrCodeId,
			completion: completion
		)
	}

	public func retrievePaymentInstruments(
		wallet: Wallet,
		completion: @escaping ApiResult<AllPaymentInstruments>
	) -> Void {
		api.retrievePaymentInstruments(wallet: wallet, completion: completion)
	}

	public func makePayment(
		paymentRequestId: String,
		instrument: PaymentInstrumentIdentifier,
		secondaryInstruments: [SecondaryPaymentInstrument]?,
		clientReference: String?,
		challengeResponses: [ChallengeResponse]?,
		completion: @escaping ApiResult<CustomerTransactionSummary>
	) {
		api.makePayment(
			paymentRequestId: paymentRequestId,
			primaryInstrument: instrument,
			secondaryInstruments: secondaryInstruments,
			clientReference: clientReference,
			challengeResponses: challengeResponses,
			completion: completion
		)
	}

	public func retrievePaymentSessionBy(
		paymentSessionId: String,
		completion: @escaping ApiResult<PaymentSession>
	) {
		api.retrievePaymentSessionBy(
			paymentSessionId: paymentSessionId,
			completion: completion
		)
	}

	public func retrievePaymentSessionBy(
		qrCodeId: String,
		completion: @escaping ApiResult<PaymentSession>
	) {
		api.retrievePaymentSessionBy(
			qrCodeId: qrCodeId,
			completion: completion
		)
	}

	public func setHost(host: String) {
		api.setHost(host: host)
		authenticator.setHost(host: host)
	}
}
